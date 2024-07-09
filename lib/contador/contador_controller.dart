// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import '../model/full_name.dart';

class ContadorController {
  var _counter = Observable<int>(0);
  // final _counter = Observable<int>(0, name: 'counter observable');
  var _fullName = Observable<FullName>(FullName(first: 'first', last: 'last'));

  late Action increment;
  late Computed _saudacaoComputed;

  ContadorController() {
    increment = Action(_incrementCounter);
    _saudacaoComputed =
        Computed(() => 'Ola ${_fullName.value.first}  ${_counter.value}');
  }

  int get counter => _counter.value;
  FullName get fullName => _fullName.value;

  String get saudacao => _saudacaoComputed.value;

  void _incrementCounter() {
    _counter.value++;
    print('Antes');
    print(_fullName.value.hashCode);
    //! Não pode fazer isso aqui
    // _fullName.value.first = 'Rodrigo'';
    // _fullName.value.last = 'Rahman;
    //! Opção 1 - Alterar por meio de prototype(copyWith)
    // //! Trocar isso:
    // _fullName.value = FullName(first: 'Rodrigo', last: 'Rahman');
    //! Por isso:
    _fullName.value =
        _fullName.value.copyWith(first: 'Rodrigo', last: 'Rahman');
    //! Na linha acima estou recebendo uma nova instancia da minha classe e
    //! substituindo pela atual

    print('Depois');
    print(_fullName.value.hashCode);
  }
}

