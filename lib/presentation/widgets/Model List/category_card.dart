import 'package:flutter/material.dart';
import '../../../models/suite_model.dart';

class CategoryCard extends StatelessWidget {
  final Suite suite;
  const CategoryCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    final displayedCategorias = suite.items.take(5).toList();

    return Container(
      width: 350,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < displayedCategorias.length; i++)
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F8FA),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      displayedCategorias[i].icon,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
            GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Ver \ntodos',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      color: Colors.black45,
                    ),
                    textAlign: TextAlign.end,
                  ),
                  Icon(Icons.keyboard_arrow_down,
                      size: 24, color: Colors.black45),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
