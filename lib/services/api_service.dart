import 'package:http/http.dart' as http;
import 'package:the_movie_database/constants/constants.dart';

class ApiService {
  static const String baseUrl = 'https://api.themoviedb.org/3/';

  Future<dynamic> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl$endpoint'));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> fetchMoviesCategories() async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/genre/movie/list?language=en'),
      headers: {'Authorization': 'Bearer $ACCESSTOKEN'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
      headers: {'Authorization': 'Bearer $ACCESSTOKEN'},
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> fetchUpcomingMovies() async {
    final response = await http.get(
      Uri.parse(
          'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'),
      headers: {'Authorization': 'Bearer $ACCESSTOKEN'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<dynamic> fetchMovieImagee(movieId) async {
    final response = await http.get(
      Uri.parse('https://api.themoviedb.org/3/movie/$movieId/images'),
      headers: {'Authorization': 'Bearer $ACCESSTOKEN'},
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
