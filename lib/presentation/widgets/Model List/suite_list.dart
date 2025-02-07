import 'package:flutter/material.dart';

import '../../../models/suite_model.dart';
import 'category_card.dart';
import 'period_list.dart';
import 'suite_card.dart';

class SuiteList extends StatelessWidget {
  final List<Suite> suites;
  const SuiteList({super.key, required this.suites});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: suites.length,
        padding: const EdgeInsets.all(12),
        itemBuilder: (context, index) {
          final suite = suites[index];
          return Column(
            children: [
              SuiteCard(suite: suite),
              const SizedBox(height: 5),
              CategoryCard(suite: suite),
              const SizedBox(height: 5),
              PeriodList(suite: suite),
            ],
          );
        },
      ),
    );
  }
}
