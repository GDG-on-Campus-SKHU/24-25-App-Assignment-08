class MovieData {
  final String poster; // 인기 영화 포스터
  final String movieTitle; // 인기 영화 제목
  final String movieMoreInfo; // 영화에 대한 소개
  final double movieRating; // 영화 평점
  final String releaseDate;
  final String backDrop;
  MovieData({
    required this.poster,
    required this.movieTitle,
    required this.movieMoreInfo,
    required this.movieRating,
    required this.releaseDate,
    required this.backDrop,
  });

  factory MovieData.fromJson(Map<String, dynamic> json) {
    return MovieData(
        poster: json['poster_path'],
        movieTitle: json['title'],
        movieMoreInfo: json['overview'],
        movieRating: json['vote_average'],
        releaseDate: json['release_date'],
        backDrop: json['backdrop_path']);
  }
}
