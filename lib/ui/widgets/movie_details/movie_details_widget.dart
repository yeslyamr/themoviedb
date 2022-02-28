import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:themoviedb/ui/theme/app_colors.dart';
import 'package:themoviedb/ui/widgets/movie_details/movie_details_model.dart';
import 'package:tuple/tuple.dart';
import 'movie_details_tab_pages/movie_details_about_page.dart';
import 'movie_details_tab_pages/movie_details_cast_page.dart';
import 'movie_details_top_header_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget>
    with SingleTickerProviderStateMixin {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    
    context.read<MovieDetailsModel>().setupLocale(context);
  }

  //TODO: tab controller for each page??
  final List<Tuple2> _pages = [
    const Tuple2('About', MovieDetailsAboutPage()),
    const Tuple2('Cast', MovieDetailsCastWidget()),
    const Tuple2('Similar', MovieDetailsAboutPage()),
    const Tuple2('Comments', MovieDetailsAboutPage()),
    const Tuple2('Reviews', MovieDetailsAboutPage()),
    const Tuple2('Fasdfsdfds', MovieDetailsAboutPage()),
  ];

  @override
  Widget build(BuildContext context) {
    final movieDetails = 
        context.watch<MovieDetailsModel>().movieDetails;
    final title = movieDetails?.title;

    return DefaultTabController(
      length: _pages.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: innerBoxIsScrolled
                      ? Text(title ?? 'title')
                      : const Text(''),
                  centerTitle: true,
                  flexibleSpace: const FlexibleSpaceBar(
                    background: SafeArea(child: TopHeaderWidget()),
                    collapseMode: CollapseMode.pin,
                  ),
                  pinned: true,
                  bottom: TabBar(
                    labelColor: AppColors.a,
                    unselectedLabelColor: AppColors.mainText,
                    indicatorColor: AppColors.a,
                    isScrollable: true,
                    tabs: _pages
                        .map<Tab>((Tuple2 page) => Tab(text: page.item1))
                        .toList(),
                  ),
                  expandedHeight:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? 450
                          : 520,
                ),
              ),
            ];
          },
          body: TabBarView(
            children: _pages.map<Widget>((Tuple2 page) {
              return SafeArea(
                top: false,
                bottom: false,
                child: Builder(
                  builder: (BuildContext context) {
                    return CustomScrollView(
                      key: PageStorageKey<String>(page.item1),
                      slivers: <Widget>[
                        SliverOverlapInjector(
                          handle:
                              NestedScrollView.sliverOverlapAbsorberHandleFor(
                                  context),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.all(0.0),
                          sliver: page.item2,
                        ),
                      ],
                    );
                  },
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class SliverPersistantHeaderDelegateImplementation
    extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;
  final Color color;

  SliverPersistantHeaderDelegateImplementation(
      {required this.tabBar, this.color = Colors.transparent});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: color,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height; //

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
