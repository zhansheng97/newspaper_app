import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:newspaper_app/domain/entities/app_error.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';
import 'package:newspaper_app/domain/entities/search_params.dart';
import 'package:newspaper_app/domain/usecases/search_news.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchNews searchNews;

  SearchBloc({required this.searchNews}) : super(SearchInitial());

  @override
  Stream<SearchState> mapEventToState(
    SearchEvent event,
  ) async* {
    if (event is SearchNewsEvent) {
      Either<AppError, List<NewsEntity>> eitherReponse =
          await searchNews(NewsParams(event.searchParams));

      yield eitherReponse.fold(
        (l) => SearchError(),
        (articles) {
          return SearchNewsLoaded(articles: articles);
        },
      );
    }
  }
}
