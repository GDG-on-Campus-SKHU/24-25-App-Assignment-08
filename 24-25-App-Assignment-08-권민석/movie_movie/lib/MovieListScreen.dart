import 'package:flutter/material.dart';
import 'package:movie_movie/Keys.dart';
import 'package:movie_movie/MovieDetailScreen.dart';
import 'package:movie_movie/MovieModel.dart';
import 'package:movie_movie/MovieService.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;
    return Scaffold(
      appBar: AppBar(
        // 앱바: 화면 제목과 스타일 정의
        title: const Text(
          'Popular Movies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFDE6B56), // 주요 색상
      ),
      body: FutureBuilder<List<MovieData>>(
        future: MovieService.getCurrentMovie(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // 로딩 상태 표시
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // 에러 상태 표시
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // 데이터가 없을 때 표시
            return const Center(child: Text('No movies available.'));
          }
          final movies = snapshot.data!;
          return Scrollbar(
            child: GridView.builder(
              // 그리드 레이아웃 설정
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 열 개수
                crossAxisSpacing: 10, // 열 간격
                mainAxisSpacing: 10, // 행 간격
                childAspectRatio: 0.7, // 아이템의 가로세로 비율
              ),
              itemCount: movies.length, // 더미 아이템 개수
              itemBuilder: (context, index) {
                final MovieData movie = movies[index];
                return GestureDetector(
                  onTap: () {
                    // 기존 API 데이터를 통해 디테일 화면으로 이동
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MovieDetailScreen(
                            movie: movie,
                          ),
                        ));
                  },
                  child: Card(
                    // 카드 디자인
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          // 이미지
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15.0),
                              topRight: Radius.circular(15.0),
                            ),
                            // 영화 포스터 이미지
                            child: Image.network(
                              '$posterWay${movie.poster}',
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.broken_image,
                                      size: 50, color: Colors.grey),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // 영화 제목
                              Text(
                                movie.movieTitle,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Icon(Icons.star,
                                      color: Colors.amber, size: 16),
                                  SizedBox(width: 4),
                                  // 영화 평점
                                  Text(
                                    'Rating: ${movie.movieRating.toStringAsFixed(3)}',
                                    style: TextStyle(fontSize: 14.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
