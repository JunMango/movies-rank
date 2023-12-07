import 'dart:convert';
import 'package:movieproject/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const _dailyBoxOfficeUrl = "http://localhost:8080/daily/boxoffice";
  static const _weeklyBoxOfficeUrl = "http://localhost:8080/week/boxoffice";

  Future<List<Movie>> getDailyBoxOffice() async {
    final response = await http.get(Uri.parse(_dailyBoxOfficeUrl));
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("error");
    }
  }

  Future<List<Movie>> getWeeklyBoxOffice() async {
    final response = await http.get(Uri.parse(_weeklyBoxOfficeUrl));
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("error");
    }
  }
}
