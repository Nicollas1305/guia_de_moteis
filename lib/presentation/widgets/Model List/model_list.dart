import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/motel_provider.dart';
import 'motel_card.dart';

class MotelList extends StatelessWidget {
  const MotelList({super.key});

  @override
  Widget build(BuildContext context) {
    final motelProvider = Provider.of<MotelProvider>(context);
    final moteis = motelProvider.moteis;
    final isLoading = motelProvider.isLoading;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (moteis.isEmpty) {
      return const Center(
        child: Text(
          "Nenhum motel encontrado",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: moteis.length,
      itemBuilder: (context, index) {
        final motel = moteis[index];
        return MotelCard(motel: motel);
      },
    );
  }
}
