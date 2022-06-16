import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spod_app/screen/main/main_screen.dart';
import 'package:spod_app/screen/onboarding_screen.dart';
import 'package:spod_app/screen/login_screen.dart';
import 'package:spod_app/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final skipOnBoarding = prefs.getBool("skipOnBoarding") ?? false;
  runApp(MyApp(skipOnBoarding: skipOnBoarding));
}

class MyApp extends StatelessWidget {
  final bool skipOnBoarding;

  const MyApp({Key? key, required this.skipOnBoarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spod',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: createMaterialColor(primaryColor500),
          canvasColor: colorWhite),
      home: skipOnBoarding ? MainScreen(currentScreen: 0) : OnboardingScreen(),
    );
  }
}
