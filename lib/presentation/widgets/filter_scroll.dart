import 'package:flutter/material.dart';

class FilterScroll extends StatelessWidget {
  FilterScroll({super.key});

  final List<String> filters = [
    'Filtros',
    'café da manhã',
    'decoração / experiências',
    'jantar',
    'hidro',
    'piscina',
    'sauna',
    'ofurô',
    'decoração erótica',
    'decoração temática',
    'cadeira erótica',
    'pista de dança',
    'garagem privativa',
    'frigobar',
    'internet wi-fi',
    'suíte para festas',
    'suíte com acessibilidade',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 35,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filters.length,
          itemBuilder: (context, index) {
            return Center(
              child: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  filters[index],
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
