// Testes unitários para o widget FilterScroll.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/presentation/widgets/filter_scroll.dart';

void main() {
  group('FilterScroll', () {
    testWidgets('Renderiza corretamente o FilterScroll e contém itens',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterScroll(),
          ),
        ),
      );

      expect(find.byType(FilterScroll), findsOneWidget);

      final listViewFinder = find.byType(ListView);
      expect(listViewFinder, findsOneWidget);

      final itemFinder = find.descendant(
        of: listViewFinder,
        matching: find.byType(Container),
      );

      expect(itemFinder, findsWidgets);
    });

    testWidgets('Lista de filtros pode ser rolada',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: FilterScroll(),
          ),
        ),
      );

      final listFinder = find.byType(ListView);
      await tester.drag(listFinder, const Offset(-300, 0));
      await tester.pump();
    });
  });
}
