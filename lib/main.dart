import 'package:easylanche/core/ambiente.dart';
import 'package:easylanche/core/instancias.dart';
import 'package:easylanche/core/rotas.dart';
import 'package:easylanche/presentation/tema.dart';
import 'package:easylanche/presentation/widgets/shared/alertas_app_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const configAmbiente = ConfiguracaoAmbiente(
    urlAPI: 'https://tadsfoodapi.herokuapp.com',
  );
  await Instancias.inicializar(configAmbiente);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    Ambiente(
      configAmbiente,
      child: MaterialApp(
        supportedLocales: [const Locale('pt', 'BR')],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: Rotas.feed,
        onGenerateRoute: Rotas.onGenerateRoute,
        builder: (context, widget) => EasylancheApp(child: widget),
        theme: Tema.temaClaro,
      ),
    ),
  );
}

class EasylancheApp extends StatefulWidget {
  final Widget? child;

  const EasylancheApp({Key? key, required this.child}) : super(key: key);

  @override
  State<EasylancheApp> createState() => _EasylancheAppState();
}

class _EasylancheAppState extends State<EasylancheApp> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertasAppHandler(child: widget.child!);
  }
}
