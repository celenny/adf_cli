import 'package:args/command_runner.dart';
import '../../../repositories/student_repository.dart';

class FindByIdCommand extends Command {
  final StudentRepository studentRepository;

  @override
  String get description => 'Find Student by Id';

  @override
  String get name => 'byId';

  FindByIdCommand(this.studentRepository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('Por favor envie o id do Aluno com o command --id=0 ou -i 0');
      return;
    }

    final id = int.parse(argResults?['id']);

    print('Aguarde buscando dados...');
    final student = await studentRepository.findById(id);
    print('---' * 10);
    print('Aluno: ${student.name}');
    print('---' * 10);
    print('Idade: ${student.age ?? 'Não informado'}');
    print('Cursos:');
    student.coursesNames.forEach(print);
    print('Endereço:');
    print('   ${student.address.street}, (${student.address.zipCode})');
    print('---' * 10);
  }
}
