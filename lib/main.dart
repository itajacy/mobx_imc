import 'package:flutter/material.dart';
import 'package:mobx_imc/contador/contador_page.dart';
import 'package:mobx_imc/imc/imc_page.dart';
import 'package:mobx_imc/observables/future/future_page.dart';
import 'package:mobx_imc/observables/list/observable_list_page.dart';
import 'package:mobx_imc/observables/modelo_observado/modelo_observado_page.dart';

import 'contador_codegen/contador_codegen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: ImcPage(),
      // home: ObservableListPage(),
      home: FuturePage(),
    );
  }
}
