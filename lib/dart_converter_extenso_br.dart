library numero_extenso;

import 'dart_remover_acentos.dart';

class ConverterExtenso {
  static String limparString(String str) {
    str = RemoverAcentos.remover(str);
    return str.replaceAll(RegExp(r'[.,!?\;\|\{\}\[\]]'), '');
  }

  static bool hasDigits(String text) {
    return text.contains(RegExp(r'\d'));
  }

  static double converter(String numeroExtenso) {
    final Map<String, int> algarismos = {
      'um': 1,
      'dois': 2,
      'tres': 3,
      'quatro': 4,
      'cinco': 5,
      'seis': 6,
      'sete': 7,
      'oito': 8,
      'nove': 9,
      'dez': 10,
      'onze': 11,
      'doze': 12,
      'treze': 13,
      'quatorze': 14,
      'catorze': 14,
      'quinze': 15,
      'dezesseis': 16,
      'dezessete': 17,
      'dezoito': 18,
      'dezenove': 19,
      'vinte': 20,
      'trinta': 30,
      'quarenta': 40,
      'cinquenta': 50,
      'sessenta': 60,
      'setenta': 70,
      'oitenta': 80,
      'noventa': 90,
      'cem': 100,
      'cento': 100,
      'duzentos': 200,
      'trezentos': 300,
      'quatrocentos': 400,
      'quinhentos': 500,
      'seiscentos': 600,
      'setecentos': 700,
      'oitocentos': 800,
      'novecentos': 900,
    };

    final Map<String, int> multiplicadores = {
      'mil': 1000,
      'milhao': 1000000,
      'milhoes': 1000000,
      'bilhao': 1000000000,
      'bilhoes': 1000000000,
      'k': 1000,
      'm': 1000000,
      'g': 1000000000,
    };

    final RegExp regexValor = RegExp(r'[\d,.]+');
    final RegExp regexNotacao = RegExp(r'[a-z]');

    final palavras = limparString(numeroExtenso);
    var numero = 0.0;
    var valor = 0.0;
    var valorStr = '';
    final bool hasDigitsInPalavras = hasDigits(palavras);
    if (hasDigitsInPalavras) {
      var notacaoCientifica = '';

      final String? valorMatch = regexValor.firstMatch(palavras)?.group(0);

      if (valorMatch != null) {
        valorStr = valorMatch.replaceAll(',', '.');
        print(valorStr); // Output: 1.000.50
      }

      final notacaoCientificaMatch =
          regexNotacao.firstMatch(palavras)?.group(0);

      if (notacaoCientificaMatch != null) {
        notacaoCientifica = notacaoCientificaMatch;
        print(notacaoCientifica); // Output: a
      }

      final multiplicador = multiplicadores[notacaoCientifica] ?? 1;
      numero = double.parse(valorStr) * multiplicador.toDouble();
    } else {
      final List<String> palavrasList = palavras.split(' ');
      for (String palavra in palavrasList) {
        if (algarismos.containsKey(palavra)) {
          valor += algarismos[palavra]!;
          continue;
        }

        if (multiplicadores.containsKey(palavra)) {
          if (valor == 0) valor = 1;
          valor *= multiplicadores[palavra]!;
          numero += valor;
          valor = 0;
        }

        if (palavra == 'centavos') {
          if (valor >= 100) {
            final dezenas = (valor.truncate() % 100.0);
            final numeroRestante = valor - dezenas;
            valor = numeroRestante + (dezenas / 100.0);
          } else {
            valor /= 100.0;
          }
        }
      }
      numero += valor;
    }

    return numero;
  }
}
