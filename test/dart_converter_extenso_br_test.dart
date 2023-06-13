import 'package:dart_numero_extenso_br/dart_converter_extenso_br.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Transcrever números para extenso', () {
    expect(ConverterExtenso.converter('dois reais'), 2);
    expect(ConverterExtenso.converter('um real'), 1);
    expect(ConverterExtenso.converter('zero'), 0);
    expect(ConverterExtenso.converter('vinte mil e dois'), 20002);
    expect(ConverterExtenso.converter('vinte mil e duzentos'), 20200);
    expect(ConverterExtenso.converter('vinte mil quinhentos e setenta'), 20570);
    expect(ConverterExtenso.converter('quinhentos mil'), 500000);
    expect(ConverterExtenso.converter('quinze milhões'), 15000000);
    expect(
      ConverterExtenso.converter(
        'duzentos e trinta e quatro milhões, quinhentos e sessenta e sete mil, oitocentos',
      ),
      234567800,
    );
    expect(
      ConverterExtenso.converter(
        'duzentos e trinta e quatro milhões, quinhentos e sessenta e sete mil, oitocentos e setenta centavos',
      ),
      234567800.70,
    );
    expect(ConverterExtenso.converter('cinco centavos'), 0.05);

    expect(
      ConverterExtenso.converter('mil reais e setenta e tres centavos'),
      1000.73,
    );
  });
}
