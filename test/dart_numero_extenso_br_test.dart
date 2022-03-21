import 'package:dart_numero_extenso_br/dart_numero_extenso_br.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  test('Transcrever números para extenso', () {    
    expect(Extenso.descrever(2), 'dois reais');
    expect(Extenso.descrever(1), 'um real');
    expect(Extenso.descrever(0), 'zero');
    expect(Extenso.descrever(0.05), 'cinco centavos');
    expect(Extenso.descrever(14051234567890.63), "quatorze trilhões, cinquenta e um bilhões, duzentos e trinta e quatro milhões, quinhentos e sessenta e sete mil, oitocentos e noventa reais e sessenta e três centavos");
  });
}
