class Movie {
  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json['id'] as int,
        title: json['title'] as String,
        overview: json['overview'] as String,
        posterPath: json['poster_path'] as String,
        releaseDate: DateTime.parse(json['release_date'] as String),
      );

  Movie.empty()
      : this(
          id: -1,
          title: '',
          overview: '',
          posterPath: '',
          releaseDate: DateTime.now(),
        );

  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final DateTime releaseDate;

  String get posterFullUrl => 'https://image.tmdb.org/t/p/w780$posterPath';

  Movie copyWith({
    int? id,
    String? title,
    String? overview,
    String? posterPath,
    DateTime? releaseDate,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}
