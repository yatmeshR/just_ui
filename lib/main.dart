import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/constant/globalvarbiles.dart';
import 'package:task/presentation/widget/bottom_bar.dart';
import 'package:task/provider/user_provider.dart';
import 'package:task/routes.dart';

// wUmz0MnHz46DJCYc



void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        useMaterial3: true, // can remove this line
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const BottomBar()

    );
    }
  }