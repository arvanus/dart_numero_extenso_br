library numero_extenso;

import 'package:intl/intl.dart';

/// Um método para converter números para valor monetário por extenso
class Extenso {
  /// Retorna o número monetário por extenso, portugues do Brasil
  /// Código convertido do PHP dos seguintes links:
  /// https://pt.stackoverflow.com/questions/99460/como-converter-n%C3%BAmero-em-float-para-n%C3%BAmero-por-extenso-no-php
  /// https://recursosdophp.blogspot.com/2012/04/ola-seguidores-do-php-bom-eu-fiz.html
  /// Autor original desconhecido
  ///
  static String descrever(double valor) {
    var singular = [], plural = [], u = [];
    singular = [
      "centavo",
      "real",
      "mil",
      "milhão",
      "bilhão",
      "trilhão",
      "quatrilhão"
    ];
    plural = [
      "centavos",
      "reais",
      "mil",
      "milhões",
      "bilhões",
      "trilhões",
      "quatrilhões"
    ];
    u = [
      "",
      "um",
      "dois",
      "três",
      "quatro",
      "cinco",
      "seis",
      "sete",
      "oito",
      "nove"
    ];

    var c = [
      "",
      "cem",
      "duzentos",
      "trezentos",
      "quatrocentos",
      "quinhentos",
      "seiscentos",
      "setecentos",
      "oitocentos",
      "novecentos"
    ];
    var d = [
      "",
      "dez",
      "vinte",
      "trinta",
      "quarenta",
      "cinquenta",
      "sessenta",
      "setenta",
      "oitenta",
      "noventa"
    ];
    var d10 = [
      "dez",
      "onze",
      "doze",
      "treze",
      "quatorze",
      "quinze",
      "dezesseis",
      "dezesete",
      "dezoito",
      "dezenove"
    ];

    var z = 0;
    var rt = "";
    var f = NumberFormat.currency(name: "");
    // Precisamos o número no seguinte padrão: 1.405.123.456.789.63
    String valorS = f.format(valor).replaceAll(",", ".");

    var inteiro = valorS.split(".");
    for (var i = 0; i < inteiro.length; i++) {
      for (var ii = inteiro[i].length; ii < 3; ii++) {
        inteiro[i] = "0" + inteiro[i];
      }
    }
    var fim =
        inteiro.length - (int.parse(inteiro[inteiro.length - 1]) > 0 ? 1 : 2);
    var r = "";
    for (var i = 0; i < inteiro.length; i++) {
      var valor = int.parse(inteiro[i]);
      var rc = ((valor > 100) && (valor < 200))
          ? "cento"
          : c[int.parse(inteiro[i][0])];
      var rd =
          (int.parse(inteiro[i][1]) < 2) ? "" : d[int.parse(inteiro[i][1])];
      var ru = (valor > 0)
          ? ((int.parse(inteiro[i][1]) == 1)
              ? d10[int.parse(inteiro[i][2])]
              : u[int.parse(inteiro[i][2])])
          : "";

      r = rc +
          ((rc.isNotEmpty && (rd.isNotEmpty || ru.isNotEmpty)) ? " e " : "") +
          rd +
          ((rd.isNotEmpty && ru.isNotEmpty) ? " e " : "") +
          ru;
      var t = inteiro.length - 1 - i;
      r += r.isNotEmpty ? " " + (valor > 1 ? plural[t] : singular[t]) : "";
      if (inteiro[i] == "000") {
        z++;
      } else if (z > 0) {
        z--;
      }
      if ((t == 1) && (z > 0) && (int.parse(inteiro[0]) > 0)) {
        r += ((z > 1) ? " de " : "") + plural[t];
      }
      if (r.isNotEmpty) {
        rt = rt +
            (((i > 0) && (i <= fim) && (int.parse(inteiro[0]) > 0) && (z < 1))
                ? ((i < fim) ? ", " : " e ")
                : " ") +
            r;
      }
    }
    return (rt.isNotEmpty ? rt : "zero").trim();
  }
}
