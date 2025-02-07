// Teste unitário para verificar se a AppBar está sendo exibida corretamente //

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/presentation/providers/motel_provider.dart';
import 'package:guia_de_moteis/presentation/widgets/appbar.dart';
import 'package:provider/provider.dart';

void main() {
  group('AppBarWidget', () {
    testWidgets('Renderiza corretamente a AppBarWidget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider(
            create: (_) => MotelProvider(),
            child: Scaffold(
              appBar: const AppBarWidget(),
            ),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
      expect(find.byIcon(Icons.search), findsOneWidget);

      expect(find.text('ir agora'), findsOneWidget);
      expect(find.text('ir outro dia'), findsOneWidget);
    });

    testWidgets('Alterna entre "Ir agora" e "Ir outro dia" corretamente',
        (WidgetTester tester) async {
      final motelProvider = MotelProvider();

      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider.value(
            value: motelProvider,
            child: Scaffold(
              appBar: const AppBarWidget(),
            ),
          ),
        ),
      );

      expect(motelProvider.isNowSelected, isTrue);

      await tester.tap(find.text('ir agora'));
      await tester.pump();

      expect(motelProvider.isNowSelected, isFalse);

      await tester.tap(find.text('ir outro dia'));
      await tester.pump();

      expect(motelProvider.isNowSelected, isTrue);
    });
  });
}
