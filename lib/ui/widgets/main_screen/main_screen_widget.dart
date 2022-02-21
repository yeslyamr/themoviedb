import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/domain/data_provider/session_data_provider.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_model.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  final movieListModel = MovieListModel();

  int _selectedPage = 1;

  void onSelectedPage(int index) {
    if (index == _selectedPage) return;
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieListModel.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.main,
      appBar: AppBar(
        
        actions: [
          IconButton(
            onPressed: () => SessionDataProvider().setSessionId(null),
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: AppColors.a,
            ),
          ),
        ],
        title: const Text("TMDB"),
      ),
      body: IndexedStack(index: _selectedPage, children: [
        const Center(child: Text("home" , style: TextStyle(color: Colors.white),)),
        NotifierProvider(
            create: () => movieListModel,
            isManagingModel: false,
          child: const MovieListWidget()),
        const Center(child: Text("search" , style: TextStyle(color: Colors.white),)),
        const Center(child: Text("profile" , style: TextStyle(color: Colors.white),)),
      ]),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.main
        ),
        child: BottomNavigationBar(
          
          currentIndex: _selectedPage,
          onTap: onSelectedPage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Media"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }
}
