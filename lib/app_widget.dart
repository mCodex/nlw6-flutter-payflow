import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/modules/insert_boleto/insert_boleto_page.dart';
import '/modules/barcode_scanner/barcode_scanner_page.dart';
import '/modules/home/home_page.dart';
import '/modules/login/login_page.dart';
import '/modules/splash/splash_page.dart';
import '/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  // This widget is the root of your application.

  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PayFlow',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => SplashPage(),
        "/home": (context) => HomePage(),
        "/login": (context) => LoginPage(),
        "/barcode_scanner": (context) => BarCodeScannerPage(),
        "/insert_boleto": (context) => InsertBoletoPage()
      },
    );
  }
}
