import 'dart:io';

class Aluno {
  String nome;
  double nota;

  Aluno(this.nome, this.nota);
}

List<Aluno> adicionarAlunos() {
  List<Aluno> alunos = [];
  while (true) {
    stdout.write('Insira o nome do aluno (ou "sair" para encerrar): ');
    String? nomeInput = stdin.readLineSync();
    if (nomeInput == null) {
      print('Entrada inválida. Tente novamente.');
      continue;
    }
    String nome = nomeInput.trim();
    if (nome.toLowerCase() == 'sair') {
      break;
    }
    stdout.write('Insira a nota de $nome: ');
    String? notaInput = stdin.readLineSync();
    if (notaInput == null) {
      print('Entrada inválida. Tente novamente.');
      continue;
    }
    double? nota = double.tryParse(notaInput.trim());
    if (nota == null) {
      print('Nota inválida. Tente novamente.');
      continue;
    }
    alunos.add(Aluno(nome, nota));
  }
  return alunos;
}

double calcularMedia(List<Aluno> alunos) {
  double somaNotas = alunos.map((aluno) => aluno.nota).reduce((a, b) => a + b);
  return somaNotas / alunos.length;
}

void imprimirAprovados(List<Aluno> alunos, double media) {
  List<Aluno> aprovados = alunos.where((aluno) => aluno.nota >= media).toList();
  if (aprovados.isEmpty) {
    print('\nNenhum aluno foi aprovado.');
  } else {
    print('\nAlunos aprovados:');
    for (var aluno in aprovados) {
      print('${aluno.nome}: ${aluno.nota}');
    }
  }
}

void main() {
  print(
      'Bem-vindo ao programa de cálculo de média e identificação de alunos aprovados!\n');

  List<Aluno> alunos = adicionarAlunos();

  if (alunos.isNotEmpty) {
    double media = calcularMedia(alunos);
    print('\nA média das notas dos alunos é: $media');

    imprimirAprovados(alunos, media);
  } else {
    print('\nNenhum aluno foi inserido.');
  }
}
