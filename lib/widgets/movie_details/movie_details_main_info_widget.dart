import 'package:flutter/material.dart';
import 'package:themoviedb/resources/resources.dart';
import 'package:themoviedb/widgets/film_screen_page/radial_percentage_widget.dart';

class MovieDetailsMainInfoWidget extends StatelessWidget {
  const MovieDetailsMainInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(51, 40, 52, 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _TopPosterWidget(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: _MovieNameWidget(),
          ),
          const _ScoreWidget(),
          const _SummaryInfoWidget(),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
            child: Text(
              "The Multiverse is unleashed!",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Color.fromRGBO(255, 255, 255, 0.62),
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
            child: Text("Overview",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600)),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20.0, bottom: 30),
            child: Text(
              "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Stan Lee",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                      Text(
                        "Characters",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Stan Lee",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                      Text(
                        "Characters",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Stan Lee",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                      Text(
                        "Characters",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Stan Lee",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                      Text(
                        "Characters",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 16, right: 20),
      child: Row(
        children: [
          Expanded(
            child: TextButton(
                onPressed: () {}, // child: Text('d')
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 44,
                      height: 44,
                      child: RadialPercentWidget(
                          child: Text(
                            '76%',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          percent: 0.76,
                          fillColor: Color.fromRGBO(8, 28, 34, 1),
                          lineColor: Colors.green,
                          freeColor: Color.fromRGBO(32, 69, 41, 1),
                          lineWidth: 3),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'User Score',
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.play_arrow),
                    Text("Play Trailer")
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class _SummaryInfoWidget extends StatelessWidget {
  const _SummaryInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromRGBO(46, 36, 47, 1),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromRGBO(121, 115, 122, 1))),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.0, vertical: 1),
                      child: Text(
                        "PG-13",
                        style:
                            TextStyle(color: Color.fromRGBO(121, 115, 122, 1)),
                      ),
                    )),
                const SizedBox(
                  width: 7,
                ),
                const Text("12/17/2021", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 5),
                const Text("(US)", style: TextStyle(color: Colors.white)),
                const SizedBox(width: 5),
                const Text("2h 28m", style: TextStyle(color: Colors.white)),
              ],
            ),
            const Text("Action, Adventure, Science Fiction",
                style: TextStyle(color: Colors.white))
          ],
        ),
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage(AppImages.spidermanposter)),
        Positioned(
            top: 20,
            bottom: 20,
            left: 20,
            child: Image(
              image: AssetImage(AppImages.spiderman),
              isAntiAlias: true,
            )),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text: const TextSpan(children: [
        TextSpan(
            text: "Spider-Man: No Way Home",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            )),
        TextSpan(
            text: " (2021)", style: TextStyle(fontWeight: FontWeight.w400)),
      ]),
    );
  }
}
