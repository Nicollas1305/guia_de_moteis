import 'package:flutter/material.dart';
import 'package:guia_de_moteis/presentation/widgets/Model%20List/motel_header.dart';
import 'package:guia_de_moteis/presentation/widgets/Model%20List/suite_list.dart';
import '../../../models/motel_model.dart';

class MotelCard extends StatelessWidget {
  final Motel motel;
  const MotelCard({super.key, required this.motel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MotelHeader(motel: motel),
        SuiteList(suites: motel.suites),
      ],
    );
  }
}
