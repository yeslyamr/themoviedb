import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';
import 'package:themoviedb/widgets/registration_verification/email_verification_widget.dart';
import 'package:themoviedb/widgets/registration_verification/reg_widget.dart';

import 'Theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Source Sans Pro',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.blueGrey
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainScreenWidget(),
        '/auth': (context) => const AuthWidget(),
        '/reg': (context) => const RegistrationScreenWidget(),
        '/mail_verification': (context) => const EmailVerificationScreenWidget(),
      },

    );
  }
}
