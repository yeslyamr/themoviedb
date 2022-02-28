import 'package:tuple/tuple.dart';

class MoviesTvShowsListService {
  final List<Tuple2<String, String>> categories = [
    const Tuple2('Popular', '/movie/popular'),
    const Tuple2('Now playing', '/movie/now_playing'),
    const Tuple2('Top Rated', '/movie/top_rated'),
    const Tuple2('Upcoming', '/movie/upcoming'),
  ];
}
