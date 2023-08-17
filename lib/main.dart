import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_database/bloc/NavigationBloc/bloc.dart';
import 'package:the_movie_database/constants/app_colors.dart';
import 'package:the_movie_database/screens/hydrated_app.dart';
import 'package:the_movie_database/services/api_service.dart';
import 'package:the_movie_database/styles/text_styles.dart';

void main() {
  final apiService = ApiService();
  final navigationBloc = NavigationBloc(apiService);

  runApp(MyApp(navigationBloc));
}

class MyApp extends StatelessWidget {
  final NavigationBloc navigationBloc;

  MyApp(this.navigationBloc);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Movie Db',
      theme: ThemeData(
          primarySwatch: AppColors.primaryColor,
          cardColor: AppColors.accentColor,
          textTheme: const TextTheme(
              displayLarge: AppTextStyles.heading1,
              displayMedium: AppTextStyles.heading2,
              bodyLarge: AppTextStyles.bodyBold,
              bodyMedium: AppTextStyles.bodyRegular,
              bodySmall: AppTextStyles.bodySmall,
              titleMedium: AppTextStyles.movieRow)),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider.value(
              value: navigationBloc,
              child: const HydratedApp(),
            ),
      },
    );
  }
}
