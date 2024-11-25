class MovieData {
  final int id; //영화 id
  final String title; //영화 title
  final String overview; //영화 설명
  final String posterPath; //post 사진 경로
  final String backDrop;
  final String date; // 영화 출시 날짜
  final double averRate; // 평균 별점

  MovieData({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backDrop,
    required this.date,
    required this.averRate
  });

  factory MovieData.fromJson(Map<String, dynamic> json){
    return MovieData(
    id: json['id'], 
    title: json['title'], 
    overview: json['overview'], 
    posterPath: json['poster_path'],
    backDrop: json['backdrop_path'], 
    date: json['release_date'], 
    averRate: json['vote_average']);
  }
}