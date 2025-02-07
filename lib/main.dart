import 'package:flutter/material.dart';
import 'package:guia_de_moteis/presentation/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'models/period_model.dart';
import 'presentation/providers/motel_provider.dart';
import 'presentation/providers/periodo_provider.dart';
import 'presentation/providers/suite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MotelProvider()),
        ChangeNotifierProxyProvider<MotelProvider, SuiteProvider>(
          create: (_) => SuiteProvider(),
          update: (_, motelProvider, suiteProvider) {
            suiteProvider!.updateSuites(
              motelProvider.moteis.expand((m) => m.suites).toList(),
            );
            return suiteProvider;
          },
        ),
        ChangeNotifierProxyProvider<MotelProvider, PeriodProvider>(
          create: (_) => PeriodProvider(),
          update: (_, motelProvider, periodoProvider) {
            periodoProvider!.updatePeriods(
              motelProvider.moteis
                  .expand((m) => m.suites)
                  .expand((s) => s.periods)
                  .cast<Period>()
                  .toList(),
            );

            return periodoProvider;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Guia de Motéis',
      theme: AppTheme.themeData,
      home: const HomePage(),
    );
  }
}
