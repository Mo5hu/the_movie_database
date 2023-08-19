import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_database/bloc/NavigationBloc/bloc.dart';
import 'package:the_movie_database/bloc/NavigationBloc/event.dart';
import 'package:the_movie_database/bloc/NavigationBloc/state.dart';
import 'package:the_movie_database/widgets/get_main_screens.dart';

class HydratedApp extends StatelessWidget {
  const HydratedApp({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationBloc = BlocProvider.of<NavigationBloc>(context);
    return BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: const Color(0xFF1B1A21),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2C2C35), Color(0xFF1B1A21)],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 16, 0, 0),
            child: getMainScreens(state, navigationBloc.apiService),
          )),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.amp_stories_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_border_rounded),
              label: 'Saved',
            )
          ],
          currentIndex: _getSelectedIndex(state),
          onTap: (index) {
            if (navigationBloc.state is LoadingState) {
            } else {
              if (index == 0) {
                navigationBloc.add(NavigateToHomeEvent());
              } else if (index == 1) {
                navigationBloc.add(NavigateToSearchEvent());
              } else if (index == 2) {
                navigationBloc.add(NavigateToSavedEvent());
              }
            }
          },
          backgroundColor: Color(0xFF1B1A21),
        ),
      );
    });
  }

  int _getSelectedIndex(NavigationState state) {
    if (state is HomeScreenState) {
      return 0;
    } else if (state is SearchScreenState) {
      return 1;
    } else if (state is SavedScreenState) {
      return 2;
    } else {
      return 0;
    }
  }
}
