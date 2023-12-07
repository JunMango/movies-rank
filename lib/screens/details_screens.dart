import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:movieproject/models/movie.dart';
import 'package:movieproject/widgets/back_button.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            // image: NetworkImage('${Constants.imageUrl}${movie.posterPath}'),
            image: NetworkImage(movie.posters),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            // Details Overlay

            CustomScrollView(
              slivers: [
                SliverAppBar(
                  leading: const BackBtn(),
                  backgroundColor: Colors.transparent,
                  expandedHeight: MediaQuery.of(context).size.height,
                  pinned: true,
                  flexibleSpace: const SizedBox.shrink(),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        // Modified poster layout
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.6,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              // child: Image.network(
                              //   '${Constants.imageUrl}${movie.posterPath}',
                              child: Image.network(
                                movie.posters,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Overview',
                              style: GoogleFonts.openSans(
                                fontSize: 25,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.auto_graph_rounded,
                                  color: Colors.amber,
                                ),
                                Text(
                                  '누적관람객수:${movie.audiAcc}',
                                  style: GoogleFonts.roboto(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          movie.plot,
                          style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Column(
                          children: [
                            Text(
                              'Release Date: ${movie.openDt}',
                              style: GoogleFonts.roboto(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
