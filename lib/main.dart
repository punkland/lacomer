import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

import 'app/config/app_constants.dart';
import 'app/config/app_theme.dart';
import 'app/localization/app_localizations.dart';
import 'app/ui/home/home_screen.dart';
import 'app/ui/login/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const LaComerApp());
}

class LaComerApp extends StatelessWidget {
  const LaComerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.appName,
          theme: AppTheme.lightTheme,
          locale: const Locale('es'),
          supportedLocales: const [
            Locale('es'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          initialRoute: '/login',
          routes: {
            '/login': (_) => const LoginScreen(),
            '/home': (_) => const HomeScreen(),
          },
        );
      },
    );
  }
}
