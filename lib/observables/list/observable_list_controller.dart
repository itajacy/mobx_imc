import 'package:mobx/mobx.dart';
import 'package:mobx_imc/model/product_model.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = ObservableListControllerBase
    with _$ObservableListController;

abstract class ObservableListControllerBase with Store {
  @observable
  // var products = <ProductModel>[];
  //* primeiro exemplo de uso do observableList
  // ObservableList products = ObservableList();
  //* segundo exemplo de uso do observableList
  var products = <ProductModel>[].asObservable();
  //* terceira forma sem
  // var products = <ProductModel>[];

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
    //! sobrescrevendo o products pelo productsData para assim conseguir atualizar
    // products = productsData;
    //* segunda forma
    products.addAll(productsData);
    //* terceira forma sem
    // products = productsData;
  }

  @action
  void addProduct() {
    //*segunda forma
    products.add(ProductModel(name: 'Computador'));
    //*terceira forma sem
    // var productsNew = [...products];
    // productsNew.add(ProductModel(name: 'Computador'));
    // products = productsNew;
  }

  @action
  void removerProduct() {
    products.removeAt(0);
  }
}
