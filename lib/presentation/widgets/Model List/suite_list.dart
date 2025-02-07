import 'package:flutter/material.dart';
import '../../../models/suite_model.dart';
import 'category_card.dart';
import 'period_list.dart';
import 'suite_card.dart';

class SuiteList extends StatefulWidget {
  final List<Suite> suites;
  const SuiteList({super.key, required this.suites});

  @override
  State<SuiteList> createState() => _SuiteListState();
}

class _SuiteListState extends State<SuiteList> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.85);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 750,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.suites.length,
        itemBuilder: (context, index) {
          final suite = widget.suites[index];
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

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
