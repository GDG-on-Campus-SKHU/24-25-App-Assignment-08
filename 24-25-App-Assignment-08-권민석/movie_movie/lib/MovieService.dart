import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_movie/Keys.dart';
import 'package:movie_movie/MovieModel.dart';

class MovieService {
  static Future<List<MovieData>> getCurrentMovie() async {
    // OpenWeatherMap API 요청 URL Call 부분 코드임
    final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/movie/popular?api_key=$apiKey',
    ));

    // 요청이 성공적으로 완료되었는지 확인
    if (response.statusCode == 200) {
      // JSON 응답을 MovieData 객체로 변환 후 반환
      final data = jsonDecode(response.body);
      return (data['results'] as List)
          .map((movieJson) => MovieData.fromJson(movieJson))
          .toList();
    } else {
      // 요청 실패 시 예외 발생
      throw Exception('Failed to load movie data');
    }
  }
}
