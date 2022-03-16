import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/home/home_page.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      // supportedLocales: [
      //   Locale('en', ''), // English, no country code
      //   Locale('es', ''), // Spanish, no country code
      // ],
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.routeName:(buildContext)=>HomePage(),
      },
      initialRoute:HomePage.routeName,
    );
  }
}