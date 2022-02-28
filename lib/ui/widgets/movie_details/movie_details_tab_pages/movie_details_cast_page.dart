import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/domain/api_client/image_downloader.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';

class MovieDetailsCastWidget extends StatelessWidget {
  const MovieDetailsCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _ActorsListWidget();
  }
}

class _ActorsListWidget extends StatelessWidget {
  const _ActorsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final cast = context.watch<MovieDetailsModel>()
        .movieDetails
        ?.credits
        .cast;

    return cast == null
        ? const Center(
            child: Text(
            'some error',
            style: TextStyle(color: Colors.black),
          ))
        : SliverFixedExtentList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              final actor = cast[index];
              final profilePath = actor.profilePath;
              String profilePicForNullProfilePath;
              switch (actor.gender) {
                case 0:
                  profilePicForNullProfilePath =
                      AppImages.profilePlaceholderNotSpecified;
                  break;
                case 1:
                  profilePicForNullProfilePath =
                      AppImages.profilePlaceholderFemale;
                  break;
                case 2:
                  profilePicForNullProfilePath =
                      AppImages.profilePlaceholderMale;
                  break;
                default:
                  profilePicForNullProfilePath =
                      AppImages.profilePlaceholderNotSpecified;
              }

              final profilePic = ClipRRect(
                borderRadius: BorderRadius.circular(35.0),
                child: profilePath != null
                    ? Image.network(
                        ImageDownloader.imageUrlW500(profilePath),
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      )
                    : Image.asset(
                        profilePicForNullProfilePath,
                        fit: BoxFit.cover,
                        height: 70,
                        width: 70,
                      ),
              );

              return ColoredBox(
                color: AppColors.secondary,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextButton(
                    // style: ButtonStyle(shape: ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        profilePic,
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                actor.name,
                                style: const TextStyle(
                                    color: AppColors.mainText,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18),
                              ),
                              Text(
                                actor.character,
                                maxLines: 3,
                                style: const TextStyle(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }, childCount: cast.length),
            itemExtent: 100);
  }
}
