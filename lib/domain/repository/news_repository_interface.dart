import 'package:dartz/dartz.dart';
import 'package:newspaper_app/domain/entities/app_error.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';

abstract class INewsRepository {
  Future<Either<AppError, List<NewsEntity>>> getHeadlineNews();
  Future<Either<AppError, List<NewsEntity>>> getNewsByCategory(String category);
  Future<Either<AppError, List<NewsEntity>>> searchNews(String searchQuery);
}
