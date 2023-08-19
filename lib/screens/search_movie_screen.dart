import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_movie_database/widgets/get_search_screen_widgets.dart';

import '../bloc/SearchBlocc/bloc.dart';
import '../bloc/SearchBlocc/event.dart';
import '../bloc/SearchBlocc/state.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchBloc = BlocProvider.of<SearchBloc>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Enter movie name',
              hintStyle: Theme.of(context).textTheme.titleMedium,
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.blue,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.blue, width: 2),
              ),
            ),
            onChanged: (value) async => {
              if (value.length > 3) {searchBloc.add(LoadDataEvent(value))}
            },
            onSubmitted: (value) => searchBloc.add(LoadDataEvent(value)),
          ),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            return getSearchScreenWidgets(state);
          }),
        ],
      ),
    );
  }
}
