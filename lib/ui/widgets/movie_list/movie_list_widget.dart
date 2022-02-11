import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/ui/widgets/movie_list/movie_list_model.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if (model == null) return const SizedBox.shrink();

    return Stack(children: [
      ListView.builder(
        padding: const EdgeInsets.only(top: 60),
        itemCount: model.movies.length,
        itemExtent: 163,
        itemBuilder: (BuildContext context, int index) {
          model.showMovieAtIndex(index);

          final movie = model.movies[index];
          final posterPath = movie.posterPath;
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
                      // Image(image: AssetImage(model.movies[index].)),
                      posterPath != null
                          ? Image.network(ApiClient.imageUrlW500(posterPath),
                              width: 95)
                          : const SizedBox.shrink(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
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
                                model.stringFromDate(movie.releaseDate),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                movie.overview,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w300),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
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
              ],
            ),
          );
        },
      ),
      ColoredBox(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: TextField(
            onChanged: model.searchMovie,
            // onEditingComplete: model.searchMovie,
            // controller: _searchController,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
                isCollapsed: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: "search"),
          ),
        ),
      ),
    ]);
  }
}
