import 'package:flutter/material.dart';

import '../../../Library/Widgets/Inherited/provider.dart';
import '../../../domain/api_client/api_client.dart';
import '../../theme/app_colors.dart';
import '../film_screen_page/radial_percentage_widget.dart';
import 'movie_details_model.dart';

class TopHeaderWidget extends StatelessWidget {
  const TopHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    final backdropPath = movieDetails?.backdropPath;
    final posterPath = movieDetails?.posterPath;
    final backdrop = backdropPath != null
        ? Image.network(
            ApiClient.imageUrlOrig(backdropPath),
            fit: BoxFit.cover,
            width: double.infinity,
            // height: 250,
          )
        : Container(
            color: AppColors.main,
            height: 250,
          );
    final poster = posterPath != null
        ? Image.network(
            ApiClient.imageUrlW500(posterPath),
            fit: BoxFit.cover,
          )
        : const SizedBox.shrink();
    final backdropSize =
        MediaQuery.of(context).orientation == Orientation.portrait ? 250 : 320;

    return Column(
      children: [
        SizedBox(
          height: backdropSize + 80,
          child: Stack(
            children: [
              SizedBox(
                child: backdrop,
                height: backdropSize.toDouble(),
              ),
              Positioned(left: 25, child: poster, height: 160, top: backdropSize - 80),
              Positioned(
                child: const _TitleAndReleaseDateWidget(),
                top: backdropSize.toDouble(),
                left: 25 + 0.67 * 160,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 60, child: _ScoreAndTrailerWidget()),
      ],
    );
  }
}

class _TitleAndReleaseDateWidget extends StatelessWidget {
  const _TitleAndReleaseDateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TODO: long titles
        Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 8, right: 10),
          child: Text(
            movieDetails?.title ?? 'title',
            maxLines: 2,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        // TODO: date reformatting
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 4),
          child: Text(movieDetails?.releaseDate?.toIso8601String() ?? ' ',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ],
    );
  }
}

class _ScoreAndTrailerWidget extends StatelessWidget {
  const _ScoreAndTrailerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    var score = movieDetails?.voteAverage;

    Color lineColor = const Color.fromRGBO(33, 208, 122, 1);
    Color freeColor = const Color.fromRGBO(32, 69, 41, 1);
    if (score != null) {
      if (score >= 7) {
        lineColor = const Color.fromRGBO(33, 208, 122, 1);
        freeColor = const Color.fromRGBO(32, 69, 41, 1);
      } else if (score >= 4) {
        lineColor = const Color.fromRGBO(210, 213, 49, 1);
        freeColor = const Color.fromRGBO(66, 61, 15, 1);
      } else {
        lineColor = const Color.fromRGBO(219, 35, 96, 1);
        freeColor = const Color.fromRGBO(87, 20, 53, 1);
      }
    }

    return Row(
      children: [
        Expanded(
          child: TextButton(
              // TODO: implement 'add score'
              onPressed: () {}, // child: Text('d')
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 44,
                    height: 44,
                    child: RadialPercentWidget(
                        child: score != null ? '${score.toInt() * 10}' : '',
                        percent: score != null ? score / 10 : 0,
                        fillColor: const Color.fromRGBO(8, 28, 34, 1),
                        lineColor: lineColor,
                        freeColor: freeColor,
                        lineWidth: 3),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Add Score',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )
                ],
              )),
        ),
        Container(
          width: 1,
          height: 24,
          color: Colors.white,
        ),
        Expanded(
          child: TextButton(
            style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white)),
            //TODO: add link to the trailer
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.play_arrow,
                  color: AppColors.a,
                ),
                Text("Play Trailer")
              ],
            ),
          ),
        ),
      ],
    );
  }
}
