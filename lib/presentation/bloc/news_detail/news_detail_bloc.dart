import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';

part 'news_detail_event.dart';
part 'news_detail_state.dart';

class NewsDetailBloc extends Bloc<NewsDetailEvent, NewsDetailState> {
  NewsDetailBloc() : super(NewsDetailInitial());

  @override
  Stream<NewsDetailState> mapEventToState(
    NewsDetailEvent event,
  ) async* {
    if (event is NewsDetailLoadEvent) {
      yield NewsDetailLoaded(article: event.article);
    }
  }
}
