import 'package:guia_de_moteis/models/period_model.dart';
import 'item_category_model.dart';

class Suite {
  final String name;
  final int quantity;
  final bool displayAvailableQty;
  final List<String> photos;
  final List<ItemCategoria> items;
  final List<Period> periods;

  Suite({
    required this.name,
    required this.quantity,
    required this.displayAvailableQty,
    required this.photos,
    required this.items,
    required this.periods,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      name: json['nome'],
      quantity: json['qtd'],
      displayAvailableQty: json['exibirQtdDisponiveis'],
      photos: List<String>.from(json['fotos']),
      items: (json['categoriaItens'] as List<dynamic>?)
              ?.map((item) => ItemCategoria.fromJson(item))
              .toList() ??
          [],
      periods: (json['periodos'] as List<dynamic>)
          .map((periodo) => Period.fromJson(periodo))
          .toList(),
    );
  }
}
