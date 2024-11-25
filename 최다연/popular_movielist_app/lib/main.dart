import 'package:flutter/material.dart';
import 'package:popular_movielist_app/MovieListScreen.dart';
import 'package:popular_movielist_app/MovieDetailScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false, // 디버그 배너 제거 (선택 사항)
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Movielist(), // WeatherApp 위젯이 MaterialApp의 home으로 설정됨
    );
  }
}
