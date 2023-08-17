class Movie {
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    print('Debugging: ' + json['vote_average'].toString());
    return Movie(
      adult: json['adult'] as bool,
      backdropPath: json['backdrop_path'] as String,
      genreIds: (json['genre_ids'] as List).cast<int>(),
      id: json['id'] as int,
      originalLanguage: json['original_language'] as String,
      originalTitle: json['original_title'] as String,
      overview: json['overview'] as String,
      popularity: json['popularity'] as double,
      posterPath: json['poster_path'] as String,
      releaseDate: json['release_date'] as String,
      title: json['title'] as String,
      video: json['video'] as bool,
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'] as int,
    );
  }
}

class MovieResponse {
  final int page;
  final List<Movie> results;

  MovieResponse({
    required this.page,
    required this.results,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> resultsJson = json['results'];
    final List<Movie> results = resultsJson.map((movieJson) {
      return Movie.fromJson(movieJson);
    }).toList();

    return MovieResponse(
      page: json['page'] as int,
      results: results,
    );
  }
}

class DateRange {
  final String maximum;
  final String minimum;

  DateRange({
    required this.maximum,
    required this.minimum,
  });

  factory DateRange.fromJson(Map<String, dynamic> json) {
    return DateRange(
      maximum: json['maximum'] as String,
      minimum: json['minimum'] as String,
    );
  }
}

class DateRangeMovieResponse extends MovieResponse {
  final DateRange dates;

  DateRangeMovieResponse({
    required this.dates,
    required int page,
    required List<Movie> results,
  }) : super(page: page, results: results);

  factory DateRangeMovieResponse.fromJson(Map<String, dynamic> json) {
    final dateRange = DateRange.fromJson(json['dates']);
    final movieResponse = MovieResponse.fromJson(json);

    return DateRangeMovieResponse(
      dates: dateRange,
      page: movieResponse.page,
      results: movieResponse.results,
    );
  }
}
