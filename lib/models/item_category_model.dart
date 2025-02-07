class ItemCategoria {
  final String name;
  final String icon;

  ItemCategoria({
    required this.name,
    required this.icon,
  });

  factory ItemCategoria.fromJson(Map<String, dynamic> json) {
    return ItemCategoria(
      name: json['nome'],
      icon: json['icone'],
    );
  }
}
