import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/domain/data_provider/session_data_provider.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';
import 'package:themoviedb/ui/widgets/home_screen/home_screen_model.dart';

import '../home_screen/home_screen_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedPage = 0;

  void onSelectedPage(int index) {
    if (index == _selectedPage) return;
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(title: const Text("TMDB"), centerTitle: true),
      body: IndexedStack(index: _selectedPage, children: [
        ChangeNotifierProvider(
            create: (_) => HomeScreenModel(), child: const HomeScreenWidget()),
        const Center(
          child: Text(
            "search",
            style: TextStyle(color: Colors.white),
          ),
        ),
        const Center(
          child: Text(
            "Watchlist",
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              SessionDataProvider().setSessionId(null);
              Navigator.of(context)
                  .pushReplacementNamed(MainNavigationRouteNames.auth);
            },
            style: ButtonStyle( backgroundColor: MaterialStateProperty.all(AppColors.a)),
            child: const Text(
              "Logout",
              style: TextStyle(color: AppColors.main, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: AppColors.main),
        child: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: onSelectedPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "Watchlist"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }
}
