import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/domain/entity/movie_details.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';

class MovieDetailsAboutPage extends StatelessWidget {
  const MovieDetailsAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        context.watch<MovieDetailsModel>().movieDetails;

    return SliverList(
        delegate: SliverChildListDelegate([
      ColoredBox(
        color: AppColors.secondary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _OverviewWidget(movieDetails: movieDetails),
            _GenresWidget(movieDetails: movieDetails),
            // const _CrewWidget(),
            _InfoWidget(movieDetails: movieDetails),
            // media
            // trailers
            //belongs to collection
            Container(
              color: Colors.red,
              height: 400,
              width: 50,
            )
          ],
        ),
      ),
    ]));
  }
}

class _InfoWidget extends StatelessWidget {
  const _InfoWidget({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  final MovieDetails? movieDetails;

  @override
  Widget build(BuildContext context) {
    const leftTextStyle = TextStyle(
        color: AppColors.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 15);
    const rightTextStyle = TextStyle(
        color: AppColors.mainText, fontWeight: FontWeight.w500, fontSize: 15);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Information about movie',
            style: TextStyle(
                color: AppColors.mainText,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                  child: Text('Original title', style: leftTextStyle)),
              Expanded(
                  child: Text(movieDetails?.originalTitle ?? '',
                      style: rightTextStyle)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: Text('Status', style: leftTextStyle)),
              Expanded(
                  child:
                      Text(movieDetails?.status ?? '', style: rightTextStyle)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: Text('Duration', style: leftTextStyle)),
              Expanded(
                  //TODO: format duration
                  child: Text(movieDetails?.runtime.toString() ?? '',
                      style: rightTextStyle)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                  child: Text('Original language', style: leftTextStyle)),
              Expanded(
                  //TODO: format orig language
                  child: Text(movieDetails?.originalLanguage ?? '',
                      style: rightTextStyle)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                  child: Text('Production country', style: leftTextStyle)),
              Expanded(
                  child: Text(movieDetails?.productionCountries[0].name ?? '',
                      style: rightTextStyle)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(
                  child: Text('Production companies', style: leftTextStyle)),
              Expanded(
                  child: Text(movieDetails?.productionCompanies[0].name ?? '',
                      style: rightTextStyle)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: Text('Budget', style: leftTextStyle)),
              Expanded(
                  //TODO: format budget
                  child: Text(movieDetails?.budget.toString() ?? '',
                      style: rightTextStyle)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Expanded(child: Text('Revenue', style: leftTextStyle)),
              Expanded(
                  //TODO: format revenue
                  child: Text(movieDetails?.revenue.toString() ?? '',
                      style: rightTextStyle)),
            ],
          ),
        ],
      ),
    );
  }
}

class _GenresWidget extends StatelessWidget {
  const _GenresWidget({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  final MovieDetails? movieDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0, top: 20),
          child: Text(
            'Genres',
            style: TextStyle(
                color: AppColors.mainText,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
        ),
        // TODO: make clickable
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10,
          ),
          child: SizedBox(
            height: 35,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movieDetails?.genres.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8),
                    child: Text(movieDetails?.genres[index].name ?? '',
                        style: const TextStyle(
                          color: AppColors.mainText,
                        )),
                  ),
                  decoration: const BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  width: 10,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _OverviewWidget extends StatelessWidget {
  const _OverviewWidget({
    Key? key,
    required this.movieDetails,
  }) : super(key: key);

  final MovieDetails? movieDetails;

  @override
  Widget build(BuildContext context) {
    final overview = movieDetails?.overview;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0, bottom: 8.0, top: 15.0),
          child: Text("Overview",
              style: TextStyle(
                  color: AppColors.mainText,
                  fontSize: 17,
                  fontWeight: FontWeight.w600)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: ExpandableText(
            // TODO: change this widget so Expand and Collapse text is on the next line
            overview != null ? overview + '\n' : '',
            collapseText: 'Collapse',
            linkStyle: const TextStyle(fontWeight: FontWeight.w700),
            linkEllipsis: false,
            maxLines: 3,
            style: const TextStyle(
                color: AppColors.mainText,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                letterSpacing: 1),
            expandText: 'Expand',
            linkColor: AppColors.a,
          ),
        ),
      ],
    );
  }
}
