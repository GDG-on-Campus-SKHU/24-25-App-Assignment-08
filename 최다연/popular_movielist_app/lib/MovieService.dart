import 'dart:convert'; // JSON 데이터를 처리하기 위한 패키지
import 'package:popular_movielist_app/keys.dart';
import 'package:popular_movielist_app/main.dart'; // Main 파일(추가적인 종속성)
import 'package:popular_movielist_app/MovieModel.dart'; // WeatherData 모델 클래스
import 'package:http/http.dart' as http; // HTTP 요청을 처리하기 위한 패키지

class MovieService {
  static Future<List<MovieData>> getMovieList() async {
    final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'));
    if (response.statusCode== 200){
      print(response.body);
      final jsonData = jsonDecode(response.body); // JSON 응답 디코드
      final List<dynamic> results = jsonData['results']; // 'results' 키에서 영화 리스트 추출

      // JSON 리스트를 Dart 객체 리스트로 변환
      return results.map((movie) => MovieData.fromJson(movie)).toList();
    }else {
      throw Exception('Fail to load Movie data');
    }
  }
}