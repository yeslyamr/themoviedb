import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';

class MyApp extends StatelessWidget {
  // final MyAppModel model;
  static final mainNavigation = MainNavigation();
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Source Sans Pro',
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.main,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.main,
            selectedItemColor: AppColors.a,
            unselectedItemColor: Colors.grey.shade600),
      ),
      initialRoute: MainNavigationRouteNames.loaderWidget,
      routes: mainNavigation.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ru', 'RU'),  
        Locale('en', 'US'), 
      ],
      onGenerateRoute: mainNavigation.onGenerateRoute,
    );
  }
}
