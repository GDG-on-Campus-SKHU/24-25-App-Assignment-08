import 'package:flutter/material.dart';
import 'package:movie_movie/Keys.dart';
import 'package:movie_movie/MovieModel.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieData movie;
  const MovieDetailScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 영화 제목
        title: Text(
          movie.movieTitle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: const Color(0xFFDE6B56), // 주요 색상
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 영화 이미지
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.network(
                    '$posterWay${movie.backDrop}',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.grey[300],
                        child: const Icon(
                          Icons.broken_image,
                          size: 100,
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // 영화 제목
                Text(
                  movie.movieTitle,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // 평점
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 4),
                    Text(
                      '${movie.movieRating.toStringAsFixed(1)}/10',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // 개봉일
                Text(
                  movie.releaseDate,
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 16),

                // 영화 개요
                const Text(
                  'Overview',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  movie.movieMoreInfo,
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
                const SizedBox(height: 16),

                // 평점 남기기 버튼
                // cf. 평점 남기고 나서 snackBar는  ScaffoldMessenger.of(context).showSnackBar 요소를 이용하면 됩니다.
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFDE6B56),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      // 평점 추가 로직
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Rating submitted successfully!'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    child: const Text('Rate Movie'),
                  ),
                ),
                const SizedBox(height: 16),

                // 뒤로가기 버튼
              ],
            ),
          ),
        ),
      ),
    );
  }
}
