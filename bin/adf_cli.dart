import 'package:args/command_runner.dart';

void main(List<String> arguments) {
  /*final argParser = ArgParser();
  argParser.addFlag('data', abbr: 'd');
  argParser.addFlag('name', abbr: 'n');
  final argResult = argParser.parse(arguments);

  print('${argResult['data']}');
  print('${argResult['name']}'); */
  CommandRunner('ADF CLI', 'ADF CLI')
    ..addCommand(ExempleCommand())
    ..run(arguments);
}

class ExempleCommand extends Command {
  @override
  String get description => 'Exemplo de comando';

  @override
  String get name => 'exemplo';

  ExempleCommand() {
    argParser.addOption('template',
        abbr: 't', help: 'Teplate de criação do projeto');
  }

  @override
  void run() {
    print(argResults?['template']);
    print('Executando algo !');
  }
}
