import 'package:flutter/material.dart';
import 'package:popular_movielist_app/MovieDetailScreen.dart';
import 'package:popular_movielist_app/MovieModel.dart';
import 'package:popular_movielist_app/MovieService.dart';

class Movielist extends StatefulWidget {
  const Movielist({super.key});

  @override
  State<Movielist> createState() => _MovieAppState();
}

class _MovieAppState extends State<Movielist> {
  List<MovieData> movieData = [];
  

  @override
  void initState() {
    super.initState();
    _loadMovie();
  } 

  Future<void> _loadMovie() async {
    try{
      final data = await MovieService.getMovieList();
      setState(() {
        movieData = data;
      });
    } catch(e) {
      print('Error loading Movie infomation: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 앱바: 화면 제목과 스타일 정의
        title: const Text(
          'Popular Movies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFDE6B56), // 주요 색상
      ),
      body: GridView.builder(
        // 그리드 레이아웃 설정
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 열 개수
          crossAxisSpacing: 10, // 열 간격
          mainAxisSpacing: 10, // 행 간격
          childAspectRatio: 0.7, // 아이템의 가로세로 비율
        ),
        itemCount: 6, // 더미 아이템 개수
        itemBuilder: (context, index) {
          final movie = movieData[index];
          return GestureDetector(
            onTap: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MovieDetailScreen(movie: movie),
                ),
              );// 기존 API 데이터를 통해 디테일 화면으로 이동
            },
            child: Card(
              // 카드 디자인
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: movieData.isEmpty
              ? const Center(child: CircularProgressIndicator()) 
              : Column(
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
                        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
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
                          movie.title,
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
                            const Icon(Icons.star, color: Colors.amber, size: 16),
                            const SizedBox(width: 4),
                            // 영화 평점
                            Text(
                              'Rating: ${movie.averRate} ',
                              style: const TextStyle(fontSize: 14.0),
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
  }
}