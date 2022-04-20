<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

Um método para converter números para valor monetário por extenso, para português brasileiro

## Features

Exemplo:
`Extenso.descrever(14051234567890.63)`
Apresentará o retorno (String):
`quatorze trilhões, cinquenta e um bilhões, duzentos e trinta e quatro milhões, quinhentos e sessenta e sete mil, oitocentos e noventa reais e sessenta e três centavos`

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

First, add this package to your project:
`dart pub add dart_numero_extenso_br`

Then, at your code import the library and use:
```dart
import 'package:dart_numero_extenso_br/dart_numero_extenso_br.dart';
...

Extenso.descrever(14051234567890.63)
```

## Additional information

Pull requests and open issues at: https://github.com/arvanus/dart_numero_extenso_br
