import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/utils/currency_formatter.dart';
import '../../../models/period_model.dart';

class PeriodCard extends StatelessWidget {
  final Period periodo;
  const PeriodCard({super.key, required this.periodo});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 95,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                periodo.formattedtime,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 7),
              Text(
                CurrencyFormatter.format(periodo.totalValue),
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
          ),
          const Icon(Icons.chevron_right, size: 24, color: Colors.black38),
        ],
      ),
    );
  }
}
