// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

class ContadorController {
  var _counter = Observable<int>(0);
  // final _counter = Observable<int>(0, name: 'counter observable');
  var _fullName = Observable<FullName>(FullName(first: 'first', last: 'last'));

  late Action increment;
  ContadorController() {
    increment = Action(_incrementCounter);
  }

  int get counter => _counter.value;
  FullName get fullName => _fullName.value;

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

class FullName {
  String first;
  String last;
  FullName({
    required this.first,
    required this.last,
  });

//! Isso aqui é conhecido como PROTOTYPE
//! Você cria um objeto igual ao anterior e substitui quando o dado for outro
//! mas continua sendo o mesmo objeto

//! Opção 1
  FullName copyWith({
    String? first,
    String? last,
  }) {
    return FullName(
      first: first ?? this.first,
      last: last ?? this.last,
    );
  }

//! Opção 2
  @override
  bool operator ==(covariant FullName other) {
    if (identical(this, other)) return true;

    return other.first == first && other.last == last;
  }

  @override
  int get hashCode => first.hashCode ^ last.hashCode;
}
