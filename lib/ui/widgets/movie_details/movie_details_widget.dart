import 'package:flutter/material.dart';
import 'package:themoviedb/Library/Widgets/Inherited/provider.dart';
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
    NotifierProvider.read<MovieDetailsModel>(context)?.setupLocale(context);
  }

  final List<Tuple2> _pages = [
    const Tuple2('About', MovieDetailsAboutPage()),
    const Tuple2('Cast', MovieDetailsCastWidget()),
    const Tuple2('Similar', MovieDetailsAboutPage()),
    const Tuple2('Comments', MovieDetailsAboutPage()),
    const Tuple2('Reviews', MovieDetailsAboutPage()),
    const Tuple2('Fasdfsdfds', MovieDetailsAboutPage()),
  ];

  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _tabController = TabController(length: _pages.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    final title = movieDetails?.title;

    //TODO:  tab controller
    return Scaffold(
      body: NestedScrollView(
        // controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          // These are the slivers that show up in the "outer" scroll view.
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                title: innerBoxIsScrolled
                    ? Text(title ?? 'title')
                    : const Text(''),
                // TODO: make title to appear when scrolled down
                centerTitle: true,
                flexibleSpace: const FlexibleSpaceBar(
                  background: SafeArea(child: TopHeaderWidget()),
                  collapseMode: CollapseMode.pin,
                ),
                pinned: true,
                expandedHeight: 400,
              ),
            ),
            SliverPersistentHeader(
                // floating: true,
                pinned: true,
                delegate: SliverPersistantHeaderDelegateImplementation(
                    tabBar: TabBar(
                      labelColor: AppColors.mainText,
                      // overlayColor: MaterialStateProperty.all(AppColors.a) ,
                      indicatorColor: AppColors.a,
                      controller: _tabController,
                      isScrollable: true,
                      tabs: _pages
                          .map<Tab>((Tuple2 page) => Tab(text: page.item1))
                          .toList(),
                    ),
                    color: AppColors.main))
          ];
        },
        body: TabBarView(
          controller: _tabController,
          // dragStartBehavior: DragStartBehavior.down,
          // These are the contents of the tab views, below the tabs.
          children: _pages.map<Widget>((Tuple2 page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                // This Builder is needed to provide a BuildContext that is
                // "inside" the NestedScrollView, so that
                // sliverOverlapAbsorberHandleFor() can find the
                // NestedScrollView.
                builder: (BuildContext context) {
                  return CustomScrollView(
                    // The "controller" and "primary" members should be left
                    // unset, so that the NestedScrollView can control this
                    // inner scroll view.
                    // If the "controller" property is set, then this scroll
                    // view will not be associated with the NestedScrollView.
                    // The PageStorageKey should be unique to this ScrollView;
                    // it allows the list to remember its scroll position when
                    // the tab view is not on the screen.
                    key: PageStorageKey<String>(page.item1),
                    slivers: <Widget>[
                      SliverOverlapInjector(
                        // This is the flip side of the SliverOverlapAbsorber
                        // above.
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),
                      ),
                      // SliverList(delegate: delegate),
                      
                      SliverPadding(
                        padding: const EdgeInsets.all(0.0),
                      // In this example, the inner scroll view has
                      // fixed-height list items, hence the use of
                      // SliverFixedExtentList. However, one could use any
                      // sliver widget here, e.g. SliverList or SliverGrid.
                      sliver: SliverList(
                        // The items in this example are fixed to 48 pixels
                        // high. This matches the Material Design spec for
                        // ListTile widgets.
                        delegate: SliverChildListDelegate([
                          page.item2
                        ]
                        ),
                      ),
                      ),
                   
                   ],
                  );
                },
              ),
            );
          }).toList(),
        ),
      ),
    );

    // return Scaffold(
    //     appBar: AppBar(
    //       title: title != null ? Text(title) : const Text('')
    //     ),
    //     body: ListView(
    //       children: const [
    //         MovieDetailsMainInfoWidget(),
    //         MovieDetailsScreenCastWidget(),
    //       ],
    //     ));
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