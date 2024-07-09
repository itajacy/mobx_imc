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
