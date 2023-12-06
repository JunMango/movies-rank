import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movieproject/constant.dart';
import 'package:movieproject/screens/details_screens.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    movie:
                        snapshot.data[itemIndex], // Removed 'const' from here
                  ),
                ),
              );
            },
            //     child: ClipRRect(
            //       borderRadius: BorderRadius.circular(12),
            //       child: SizedBox(
            //         height: 300,
            //         width: 200,
            //         child: Image.network(
            //           '${Constants.imageUrl}${snapshot.data[itemIndex].posterPath}',
            //           filterQuality: FilterQuality.high,
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            //   );
            // },
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: Image.network(
                      '${snapshot.data[itemIndex].posters}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8, // Adjust the top position as needed
                  right: 8, // Adjust the right position as needed
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '누적 관객수:${snapshot.data[itemIndex].audiAcc}',
                      // '누적 관객수: ${Constants.person}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        options: CarouselOptions(
          height: 300,
          autoPlay: true,
          viewportFraction: 0.65,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          enlargeCenterPage: true,
          pageSnapping: true,
        ),
      ),
    );
  }
}
