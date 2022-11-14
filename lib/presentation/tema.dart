import 'package:easylanche/core/constants/cores.dart';
import 'package:flutter/material.dart';

class Tema {
  static final temaClaro = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline6: TextStyle(color: Cores.laranjaPrincipal),
    ),
    primarySwatch: MaterialColor(
      Cores.laranjaPrincipal.value,
      {
        50: Cores.laranjaPrincipal,
        100: Cores.laranjaPrincipal,
        200: Cores.laranjaPrincipal,
        300: Cores.laranjaPrincipal,
        400: Cores.laranjaPrincipal,
        500: Cores.laranjaPrincipal,
        600: Cores.laranjaPrincipal,
        700: Cores.laranjaPrincipal,
        800: Cores.laranjaPrincipal,
        900: Cores.laranjaPrincipal,
      },
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusColor: Cores.cinzaEscuro,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
          width: 2,
        )
      )
    ),
    scaffoldBackgroundColor: Cores.cinzaBackground,
  );
}
