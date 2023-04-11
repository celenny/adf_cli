//import 'dart:io';
import 'dart:io';

import 'package:args/command_runner.dart';
import '../../../repositories/student_repository.dart';

class DeleteCommand extends Command {
  final StudentRepository studentRepository;

  @override
  String get description => 'Delete Student by Id';

  @override
  String get name => 'delete';

  DeleteCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    final id = int.tryParse(argResults?['id']);

    if (id == null) {
      print('Por favor informe o id do Aluno com o command --id=0 ou -i 0');
      return;
    }

    print('Aguarde...');
    final student = await studentRepository.findById(id);
    print('Confirma a exclusão do aluno ${student.name}? (S ou N)');
    final resultDelete = stdin.readLineSync();

    if (resultDelete?.toLowerCase() == 's') {
      await studentRepository.deleteById(id);
      print('---' * 27);
      print('${'---' * 9}Aluno deletado com sucesso!${'---' * 9}');
      print('---' * 27);
    } else{
      print('---' * 27);
      print('${'---' * 10} Operação cancelada! ${'---' * 10}');
      print('---' * 27);
    }
  }
}
