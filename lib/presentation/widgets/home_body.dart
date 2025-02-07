import 'package:flutter/material.dart';

import 'Model List/model_list.dart';
import 'date_picker_bar.dart';
import 'filter_scroll.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePickerBar(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 2),
              decoration: BoxDecoration(
                color: Theme.of(context).secondaryHeaderColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  FilterScroll(),
                  const Divider(height: 1, color: Colors.grey),
                  const Expanded(child: MotelList()),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
