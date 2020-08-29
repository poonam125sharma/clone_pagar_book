import 'package:flutter/material.dart';
import 'package:pagar_book/routes/custom_routes.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  return runApp(PagarBookApp());
}

class PagarBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: [
      //   // ... app-specific localization delegate[s] here
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.yellowAccent,
      ),
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      initialRoute: '/',
      routes: customRoutes,
    );
  }
}