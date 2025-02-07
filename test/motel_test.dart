import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/presentation/providers/motel_provider.dart';
import 'package:guia_de_moteis/presentation/widgets/Model%20List/model_list.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'mock/fake_motel_service.dart';

class TestHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = TestHttpOverrides();
  });

  group('MotelList', () {
    testWidgets(
        'Exibe indicador de carregamento enquanto os motéis são buscados',
        (WidgetTester tester) async {
      final provider = MotelProvider(motelService: FakeMotelService());

      await tester.pumpWidget(
        ChangeNotifierProvider<MotelProvider>.value(
          value: provider,
          child: const MaterialApp(
            home: Scaffold(body: MotelList()),
          ),
        ),
      );

      provider.loadMotels();
      await tester.pump();

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pumpAndSettle();

      expect(find.text("Motel Paraiso"), findsOneWidget);
    });

    testWidgets('Exibe mensagem quando não há motéis',
        (WidgetTester tester) async {
      final provider = MotelProvider();

      await tester.pumpWidget(
        ChangeNotifierProvider<MotelProvider>.value(
          value: provider,
          child: const MaterialApp(
            home: Scaffold(body: MotelList()),
          ),
        ),
      );

      await tester.pump();

      expect(find.text("Nenhum motel encontrado"), findsOneWidget);
    });

    testWidgets('Renderiza motéis e suítes com todas as suas informações corretamente',
        (WidgetTester tester) async {
      final provider = MotelProvider(motelService: FakeMotelService());

      await tester.pumpWidget(
        ChangeNotifierProvider<MotelProvider>.value(
          value: provider,
          child: const MaterialApp(
            home: Scaffold(body: MotelList()),
          ),
        ),
      );

      await tester.runAsync(() async {
        await provider.loadMotels();
      });

      await tester.pumpAndSettle();

      // Verifica dados do motel //
      expect(find.text("Motel Paraiso"), findsOneWidget);
      expect(find.text("Centro"), findsOneWidget);
      expect(find.text("120 avaliações"), findsOneWidget);
      expect(find.text("4.5"), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image &&
              widget.image is NetworkImage &&
              (widget.image as NetworkImage).url ==
                  "https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif",
        ),
        findsOneWidget,
      );

      expect(find.byType(ListView), findsOneWidget);

      // Verifica os dados da suíte //
      expect(find.text("Suite Master"), findsOneWidget);
      expect(find.text("2 horas"), findsOneWidget);
      expect(find.text("R\$ 40.00"), findsOneWidget);
      expect(find.text("3 horas"), findsOneWidget);
      expect(find.text("R\$ 60.00"), findsOneWidget);

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image &&
              widget.image is NetworkImage &&
              ((widget.image as NetworkImage).url ==
                  "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg"),
        ),
        findsNWidgets(1),
      );

      expect(
        find.byWidgetPredicate(
          (widget) =>
              widget is Image &&
              widget.image is NetworkImage &&
              ((widget.image as NetworkImage).url ==
                      "https://cdn.guiademoteis.com.br/Images/itens-suites/frigobar-04-09-2018-12-14.png" ||
                  (widget.image as NetworkImage).url ==
                      "https://cdn.guiademoteis.com.br/Images/itens-suites/internet-wifi-22-08-2018-11-42.png"),
        ),
        findsNWidgets(2),
      );
    });
  });
}
