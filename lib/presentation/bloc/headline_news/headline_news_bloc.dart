import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:newspaper_app/domain/entities/app_error.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';
import 'package:newspaper_app/domain/entities/no_params.dart';
import 'package:newspaper_app/domain/usecases/get_headline_news.dart';

part 'headline_news_event.dart';
part 'headline_news_state.dart';

class HeadlineNewsBloc extends Bloc<HeadlineNewsEvent, HeadlineNewsState> {
  final GetHeadLineNews getHeadLineNews;

  HeadlineNewsBloc({required this.getHeadLineNews})
      : super(HeadlineNewsInitial());

  @override
  Stream<HeadlineNewsState> mapEventToState(
    HeadlineNewsEvent event,
  ) async* {
    if (event is HeadlineNewsLoadEvent) {
      Either<AppError, List<NewsEntity>> eitherReponse =
          await getHeadLineNews(NoParams());
      yield eitherReponse.fold(
        (l) => HeadlineNewsError(),
        (articles) {
          return HeadlineNewsLoaded(articles: articles);
        },
      );
    }
  }
}
