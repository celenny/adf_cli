import 'dart:io';
import 'package:args/command_runner.dart';
import '../../../repositories/student_dio_repository.dart';
//import '../../../repositories/student_repository.dart';

class FindAllCommand extends Command {
  //final StudentRepository studentRepository;
  final StudentDioRepository studentRepository;

  @override
  String get description => 'Find all Students';

  @override
  String get name => 'findAll';

  FindAllCommand(
    this.studentRepository,
  );

  @override
  Future<void> run() async {
    print('Aguarde buscando alunos...');

    print('Deseja apresentar os cursos? (S ou N)');
    final showCourses = stdin.readLineSync();

    print('---' * 27);
    print('${'---' * 12}Alunos${'---' * 13}');
    print('---' * 27);
    final students = await studentRepository.findAll();
    for (var student in students) {
      if (showCourses?.toLowerCase() == 's') {
        print(
            '${student.id} - ${student.name} ${student.courses.where((course) => course.isStudent).map((e) => e.name).toList()}');
      } else {
        print('${student.id} - ${student.name}');
      }
    }
  }
}
