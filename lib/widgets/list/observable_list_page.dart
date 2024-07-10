import 'package:flutter/material.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({super.key});

  @override
  State<ObservableListPage> createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Adicionar'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Remover'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Carregar'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
