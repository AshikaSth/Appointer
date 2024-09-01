// import 'package:appoiter/firebase_options.dart';
// import 'package:appoiter/home.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'usersession.dart'; // Replace 'your_app' with your actual app package name
//
// Future <void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//   runApp(
//     ChangeNotifierProvider(
//       create: (context) => UserSession(),
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Home());
//   }
// }
import 'package:appoiter/firebase_options.dart';
import 'package:appoiter/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:googleapis/shared.dart';
import 'package:provider/provider.dart';
import 'usersession.dart'; // Replace 'your_app' with your actual app package name

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserSession(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // Set debugShowCheckedModeBanner to false
        title: 'Appointer',
        theme: ThemeData(
          //colorScheme: ColorScheme.fromSwatch(),
          primaryColor: Color(0xFF255B78),
          scaffoldBackgroundColor: Color(0xFFFFFFFF),
          textTheme: TextTheme(
            // Set the font family to Roboto for the entire app

              // Set the font family to Roboto for all titles
              headline1: TextStyle(fontFamily: 'Roboto', fontSize: 36, fontWeight: FontWeight.bold),
              headline2: TextStyle(fontFamily: 'Roboto', fontSize: 36, fontWeight: FontWeight.bold),
              headline3: TextStyle(fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.bold),
              headline4: TextStyle(fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.bold),
              headline5: TextStyle(fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.bold),
              headline6: TextStyle(fontFamily: 'Roboto', fontSize: 22, fontWeight: FontWeight.bold),//for appbar
              // Add more text styles as needed

            bodyText1: TextStyle(fontFamily: 'Roboto'),
            bodyText2: TextStyle(fontFamily: 'Roboto'),
            // Add more text styles as needed
          ),

          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Color(0xFF255B78)), // Set the text color of the text button
            ),
          ),
          iconTheme: IconThemeData(
            color: Color(0xFF255B78), // Set the color of icons used within buttons
          ),
        ),
        home: Home());
  }
}
