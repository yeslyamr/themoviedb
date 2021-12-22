import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {

  MovieListWidget({Key? key}) : super(key: key);

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      imageName: AppImages.spiderman,
      title: 'Смертельная битва',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Прибытие',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman,
      title: 'Назад в будущее 1',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Назад в будущее 2',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman,
      title: 'Назад в будущее 3',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Первому игроку приготовится',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman,
      title: 'Пиксели',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Человек паук',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman,
      title: 'Лига справедливости',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Человек из стали',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman,
      title: 'Мстители',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Форд против феррари',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman,
      title: 'Джентельмены',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Тихие зори',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman,
      title: 'В бой идут одни старики',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      imageName: AppImages.spiderman1,
      title: 'Дюна',
      time: 'April  7, 2021',
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
  ];

  final _searchController = TextEditingController();

  var _filteredMovies = <Movie>[];

  void _searchMovies( ) {
    if (_searchController.text.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(_searchController.text.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState((){});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [

      ListView.builder(

        padding: const EdgeInsets.only(top: 60),
        itemCount: _filteredMovies.length,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          final movie = _filteredMovies[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(1, 2),
                        )
                      ],
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Image(image: AssetImage(movie.imageName)),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 2.5),
                              Text(
                                movie.time,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.description,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                  ),
                )
              ],
            ),
          );
        },
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: TextField(
          controller: _searchController,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(
            isCollapsed: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0)),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: "search"
          ),
        ),
      ),
    ]);
  }
}
