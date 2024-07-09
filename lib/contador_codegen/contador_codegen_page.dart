import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_imc/contador_codegen/contador_codegen_controller.dart';

class ContadorCodegenPage extends StatefulWidget {
  ContadorCodegenPage({super.key});

  @override
  State<ContadorCodegenPage> createState() => _ContadorCodegenPageState();
}

class _ContadorCodegenPageState extends State<ContadorCodegenPage> {
  final controller = ContadorCodegenController();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();
//! autorun fica escutando as variaveis dentro dele e
//! tambem roda logo quando executado
    final autorunDisposer = autorun((_) {
      print('---- auto run --------');
      print(controller.fullName.first);
      // print(controller.fullName.last);
    });

//! reaction nós falamos para o mobx qual o atributo observável que queremos observar!!!
    final reactionDisposer1 = reaction((_) => controller.counter, (counter) {
      print('-----------------------  reaction  ------------------');
      print(counter);
    });

    final whenDisposer = when(
      (_) => controller.fullName.first == 'Rodrigo',
      () {
        print('-----------------------  when  ------------------');
        print(controller.fullName.first);
      },
    );

    reactionDisposer.add(autorunDisposer);
    reactionDisposer.add(reactionDisposer1);
    reactionDisposer.add(whenDisposer);
  }

  @override
  void dispose() {
    super.dispose();
    reactionDisposer.forEach((reaction) => reaction());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Contador MobX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Observer(
              builder: (_) {
                return Text(
                  '${controller.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.first);
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.fullName.last);
              },
            ),
            Observer(
              builder: (_) {
                return Text(controller.saudacao);
              },
            ),
            TextButton(
              onPressed: () => controller.changeName(),
              child: const Text('Change Name'),
            ),
            TextButton(
              onPressed: () => controller.rollbackName(),
              child: const Text('Rollback Name'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
