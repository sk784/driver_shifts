import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'injectable/injectable.dart';
import 'presentation/day/day_screen.dart';
import 'utils/colors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'ru';
  await initializeDateFormatting('ru');
  configureDependencies();
  runApp(const DriverShiftsApp());
}

class DriverShiftsApp extends StatelessWidget {
  const DriverShiftsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Дневник смен',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ru'),
      supportedLocales: const [Locale('ru')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: kColorPrimary),
      ),
      home: const DayScreen(),
    );
  }
}
