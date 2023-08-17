class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}

class GenresResponse {
  final List<Genre> genres;

  GenresResponse({required this.genres});

  factory GenresResponse.fromJson(Map<String, dynamic> json) {
    final List<dynamic> genresJson = json['genres'];
    final List<Genre> genres = genresJson.map((genreJson) {
      return Genre.fromJson(genreJson);
    }).toList();

    return GenresResponse(genres: genres);
  }
}
