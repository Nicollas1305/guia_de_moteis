import 'package:flutter/material.dart';
import '../../../models/suite_model.dart';
import 'period_card.dart';

class PeriodList extends StatelessWidget {
  final Suite suite;
  const PeriodList({super.key, required this.suite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var periodo in suite.periods) ...[
          PeriodCard(periodo: periodo),
          const SizedBox(height: 5),
        ],
      ],
    );
  }
}
