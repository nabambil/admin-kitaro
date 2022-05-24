import 'package:admin_kitaro/state/detail.dart';
import 'package:admin_kitaro/state/drawer.dart';
import 'package:admin_kitaro/state/home.dart';
import 'package:admin_kitaro/state/session.dart';
import 'package:admin_kitaro/state/stateController.dart';
import 'package:admin_kitaro/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        SessionProvider.create(),
        DrawerProvider.create(),
        SplashProvider.create(),
        HomeProvider.create(),
        DetailProvider.create(null, null),
        SplashProvider.createProvider(),
        HomeProvider.createProvider(),
        DetailProvider.createProvider(),
      ],
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
      title: 'Admin Kitaro',
      theme: ThemeData(
        primaryColor: kThemeColorDarker,
        textTheme: GoogleFonts.montserratTextTheme(Theme.of(context).textTheme),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        appBarTheme: const AppBarTheme(color: kThemeColor),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashProvider.create(),
    );
  }
}
