import 'package:flutter/material.dart';
import '../../../models/suite_model.dart';

class SuiteCard extends StatelessWidget {
  final Suite suite;
  const SuiteCard({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 280,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem da suíte
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                suite.photos.isNotEmpty ? suite.photos.first : '',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // Nome da suíte
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                suite.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
