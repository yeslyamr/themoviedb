import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';
import 'package:themoviedb/ui/widgets/home_screen/home_screen_model.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_model.dart';
import 'package:tuple/tuple.dart';

import '../../../domain/api_client/image_downloader.dart';

class HorizontalMovieListWidget extends StatefulWidget {
  const HorizontalMovieListWidget({Key? key, required this.category})
      : super(key: key);

  final Tuple2 category;

  @override
  State<HorizontalMovieListWidget> createState() =>
      _HorizontalMovieListWidgetState();
}

class _HorizontalMovieListWidgetState extends State<HorizontalMovieListWidget> {
  @override
  void didChangeDependencies() {
    context.read<MovieListViewModel>().setupLocale(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MovieListViewModel>();

    return Column(
      children: [
        _CategoryWidget(widget: widget),
        _MoviesListWidget(model: model)
      ],
    );
  }
}

class _CategoryWidget extends StatelessWidget {
  const _CategoryWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HorizontalMovieListWidget widget;

  @override
  Widget build(BuildContext context) {
    final model = context.read<HomeScreenModel>();

    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () => model.openMovieListWidget(context,  category: widget.category),
            child: Text(
              widget.category.item1,
              style: const TextStyle(
                  color: AppColors.mainText,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
              child: Text(
            'MOVIES',
            style: TextStyle(color: AppColors.secondaryText),
          )),
          IconButton(
            onPressed: () => model.openMovieListWidget(context,  category: widget.category),
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}

class _MoviesListWidget extends StatelessWidget {
  const _MoviesListWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final MovieListViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.movies.length,
          itemExtent: 120,
          itemBuilder: (BuildContext context, int index) {
            final movie = model.movies[index];
            final posterPath = movie.posterPath;
            return Stack(children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PosterImageWidget(
                      posterPath: posterPath,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(
                        child: Text(
                      movie.title,
                      style: const TextStyle(
                          color: AppColors.mainText,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    )),
                  ],
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () => model.onMovieTap(context, index),
                ),
              )
            ]);
          }),
    );
  }
}

class _PosterImageWidget extends StatelessWidget {
  const _PosterImageWidget({
    Key? key,
    required this.posterPath,
  }) : super(key: key);

  final String? posterPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          color: AppColors.secondary,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(1, 2),
            )
          ],
          border: Border.all(color: AppColors.main.withOpacity(0.2)),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: posterPath != null
          ? FadeInImage.assetNetwork(
              image: ImageDownloader.imageUrlW500(posterPath!),
              fadeInDuration: const Duration(milliseconds: 100),
              fadeOutDuration: const Duration(milliseconds: 50),
              placeholderFit: BoxFit.cover,
              height: 150,
              placeholder: AppImages.profilePlaceholderNotSpecified,
            )
          : const SizedBox.shrink(),
    );
  }
}
