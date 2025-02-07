import 'suite_model.dart';

class Motel {
  final String fantasyName;
  final String logo;
  final String neighborhood;
  final double distance;
  final int qtyFavorites;
  final List<Suite> suites;
  final int quantityAssessments;
  final double media;

  Motel({
    required this.fantasyName,
    required this.logo,
    required this.neighborhood,
    required this.distance,
    required this.qtyFavorites,
    required this.suites,
    required this.quantityAssessments,
    required this.media,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      fantasyName: json['fantasia'],
      logo: json['logo'],
      neighborhood: json['bairro'],
      distance: (json['distancia'] as num).toDouble(),
      qtyFavorites: json['qtdFavoritos'],
      suites: (json['suites'] as List<dynamic>)
          .map((suite) => Suite.fromJson(suite))
          .toList(),
      quantityAssessments: json['qtdAvaliacoes'],
      media: (json['media'] as num).toDouble(),
    );
  }
}
