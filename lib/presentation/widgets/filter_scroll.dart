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
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 40,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: filters.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Text(
                filters[index],
                style: const TextStyle(fontSize: 14),
              ),
            );
          },
        ),
      ),
    );
  }
}
