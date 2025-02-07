import 'package:flutter/material.dart';
import '../../../models/motel_model.dart';

class MotelHeader extends StatelessWidget {
  final Motel motel;
  const MotelHeader({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).secondaryHeaderColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Imagem circular do motel
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
              motel.logo,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome e bairro do motel
                Text(
                  motel.fantasyName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  motel.neighborhood,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 7),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.amber),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 16),
                          const SizedBox(width: 5),
                          Text(
                            motel.media.toStringAsFixed(1),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    // Número de avaliações
                    Row(
                      children: [
                        Text(
                          '${motel.quantityAssessments} avaliações',
                          style: const TextStyle(fontSize: 14),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.keyboard_arrow_down,
                            size: 16, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.favorite,
              color: Color(0xFFC2C2C2),
              size: 30,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
