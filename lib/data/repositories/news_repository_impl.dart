import 'package:dartz/dartz.dart';
import 'package:newspaper_app/data/data_sources/data_sources.dart';
import 'package:newspaper_app/domain/entities/app_error.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';
import 'package:newspaper_app/domain/repository/news_repository_interface.dart';

class NewsRepositoryImpl implements INewsRepository {
  final IDataSources _dataSources;

  NewsRepositoryImpl(this._dataSources);

  @override
  Future<Either<AppError, List<NewsEntity>>> getHeadlineNews() async {
    try {
      List<NewsEntity> articles = await _dataSources.getHeadlinesNew();
      return Right(articles);
    } catch (_) {
      return Left(AppError(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<NewsEntity>>> getNewsByCategory(
      String category) async {
    try {
      List<NewsEntity> articles =
          await _dataSources.getNewsByCategory(category);
      return Right(articles);
    } catch (_) {
      return Left(AppError(message: "Something went wrong"));
    }
  }

  @override
  Future<Either<AppError, List<NewsEntity>>> searchNews(
      String searchQuery) async {
    try {
      List<NewsEntity> articles = await _dataSources.searchNews(searchQuery);
      return Right(articles);
    } catch (_) {
      return Left(AppError(message: "Something went wrong"));
    }
  }
}
