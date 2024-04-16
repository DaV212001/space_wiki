import 'package:flutter/material.dart';

TextStyle largeAppName = const TextStyle(
  fontSize: 55,
  fontWeight: FontWeight.bold,
);

TextStyle mediumIshBold({String? font}) {
  return TextStyle(fontSize: 35, fontWeight: FontWeight.bold, fontFamily: font);
}

TextStyle normalRegular = const TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.normal,
);

TextStyle mediumBold =
    const TextStyle(fontSize: 23, fontWeight: FontWeight.bold);

TextStyle mediumRegular = const TextStyle(fontSize: 23);

LinearGradient appBlueGradient = const LinearGradient(
  colors: [Color(0xff44e8fd), Color(0xff7a90ff)],
  stops: [0.25, 0.75],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
);
