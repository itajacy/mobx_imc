import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase
    with _$ObservableListController;

abstract class ObservableListControllerBase with Store {
  @observable
  var products = <ProductModel>[];

  @action
  void loadProducts() {
    // products.addAll([
    //   ProductModel(name: 'Computador'),
    //   ProductModel(name: 'Celular'),
    //   ProductModel(name: 'Teclado'),
    //   ProductModel(name: 'Mouse'),
    // ]);

    //! aqui em cima não funcionou pq para atualizar/exibir atualizado
    //! precisa criar uma nova instancia como foi feito logo abaixo
    var productsData = [
      ProductModel(name: 'Computador'),
      ProductModel(name: 'Celular'),
      ProductModel(name: 'Teclado'),
      ProductModel(name: 'Mouse'),
    ];

    products = productsData;
  }
}
