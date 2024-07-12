import 'package:flutter/material.dart';

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  Future<String> buscarNome() async {
    await Future.delayed(Duration(seconds: 2));
    return 'Rodrigo Rahman';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder<String>(
        future: buscarNome(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const SizedBox.shrink();
            case ConnectionState.waiting:
            case ConnectionState.active:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return Center(
                  child: Text(snapshot.data!),
                );
              }
              return const Center(
                child: Text('Nome não encontrado!'),
              );
          }
        },
      ),
    );
  }
}
