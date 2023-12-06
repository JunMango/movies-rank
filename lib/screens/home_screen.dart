import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieproject/api/api.dart';
import 'package:movieproject/models/movie.dart';
import '../widgets/movies_slider.dart';
import 'package:movieproject/widgets/multi_search.dart';
import '../widgets/trending_slider.dart';
import 'package:movieproject/colors.dart';
import 'dart:math';
import 'dart:ui';
import 'dart:async';

void main() {
  runApp(const MaterialApp(
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Movie>> dailyBoxOfficeMovies;
  late Future<List<Movie>> weeklyBoxOfficeMovies;
  late Color startColor;
  late Color endColor;
  late Color currentColor;
  late Decoration backgroundDecoration;
  late double t = 0.0;

  @override
  void initState() {
    super.initState();
    dailyBoxOfficeMovies = Api().getDailyBoxOffice();
    weeklyBoxOfficeMovies = Api().getWeeklyBoxOffice();
    startColor = getRandomColor();
    endColor = getRandomColor();
    currentColor = startColor;
    backgroundDecoration = _buildGradientDecoration();

    // 1초마다 전체 색상 천천히 변화
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        t += 0.05; // 0.01씩 증가하면서 전체 색상을 천천히 변화
        if (t >= 1.0) {
          t = 0.0; // 1.0에 도달하면 다시 0.0으로 초기화
          startColor = endColor;
          endColor = getRandomColor();
        }
        backgroundDecoration = _buildGradientDecoration();
      });
    });
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }

  Color calculateTweenColor() {
    // 계산된 색상이 천천히 변하도록 0.01씩 감소
    return Color.lerp(currentColor, startColor, 0.05) ?? startColor;
  }

  BoxDecoration _buildGradientDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.lerp(startColor, endColor, t) ?? startColor,
          Color.lerp(startColor, endColor, 1.0) ?? endColor,
        ],
        begin: Alignment.topLeft,
        end: Alignment.topRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("By Flutter"),
        flexibleSpace: Container(
          decoration: backgroundDecoration,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: backgroundDecoration,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle('일간 박스 오피스'),
                SizedBox(
                  child: FutureBuilder(
                    future: dailyBoxOfficeMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingSlider(snapshot: snapshot);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const SectionTitle('주간 박스 오피스'),
                SizedBox(
                  child: FutureBuilder(
                    future: weeklyBoxOfficeMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return TrendingSlider(snapshot: snapshot);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const SectionTitle('랭킹별 Daily BoxOffice'),
                SizedBox(
                  child: FutureBuilder(
                    future: dailyBoxOfficeMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesSlider(snapshot: snapshot);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
                const SectionTitle('랭킹별 Weekly BoxOffice'),
                SizedBox(
                  child: FutureBuilder(
                    future: weeklyBoxOfficeMovies,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return MoviesSlider(snapshot: snapshot);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
