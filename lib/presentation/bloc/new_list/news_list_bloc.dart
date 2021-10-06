import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:newspaper_app/domain/entities/app_error.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';
import 'package:newspaper_app/domain/entities/no_params.dart';
import 'package:newspaper_app/domain/entities/search_params.dart';
import 'package:newspaper_app/domain/usecases/get_headline_news.dart';
import 'package:newspaper_app/domain/usecases/get_news_by_category.dart';

part 'news_list_event.dart';
part 'news_list_state.dart';

class NewsListBloc extends Bloc<NewsListEvent, NewsListState> {
  final GetNewsByCategory getNewsByCategory;
  final GetHeadLineNews getHeadLineNews;

  NewsListBloc({
    required this.getNewsByCategory,
    required this.getHeadLineNews,
  }) : super(NewsListInitial());

  @override
  Stream<NewsListState> mapEventToState(
    NewsListEvent event,
  ) async* {
    if (event is NewListLoadEvent) {
      switch (event.category) {
        case "business":
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getNewsByCategory(NewsParams(event.category));
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
        case "entertainment":
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getNewsByCategory(NewsParams(event.category));
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
        case "general":
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getNewsByCategory(NewsParams(event.category));
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
        case "health":
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getNewsByCategory(NewsParams(event.category));
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
        case "science":
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getNewsByCategory(NewsParams(event.category));
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
        case "sports":
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getNewsByCategory(NewsParams(event.category));
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
        case "technology":
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getNewsByCategory(NewsParams(event.category));
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
        default:
          {
            Either<AppError, List<NewsEntity>> eitherResponse =
                await getHeadLineNews(NoParams());
            yield eitherResponse.fold(
              (l) => NewsListError(),
              (articles) {
                return NewsListLoaded(articles: articles);
              },
            );
          }
          break;
      }
    }
  }
}
