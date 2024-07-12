import 'package:mobx/mobx.dart';
part 'future_controller.g.dart';

class FutureController = FutureControllerBase with _$FutureController;

abstract class FutureControllerBase with Store {
  @observable
  // ObservableFuture<String> nomeFuture = Future.value('').asObservable();
  ObservableFuture<String> nomeFuture = ObservableFuture.value('');

  Future<void> buscarNome() async {
    final buscaNomeFuture =
        Future.delayed(const Duration(seconds: 2), () => 'Rodrigo ahman');

    nomeFuture = ObservableFuture(buscaNomeFuture);

    // nomeFuture =
    //     Future.delayed(const Duration(seconds: 2), () => 'Rodrigo ahman')
    //         .asObservable();

    // await Future.delayed(const Duration(seconds: 2));
    // return 'Rodrigo Rahman';
  }
}
