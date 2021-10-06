import 'package:newspaper_app/domain/entities/app_error.dart';
import 'package:dartz/dartz.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';
import 'package:newspaper_app/domain/entities/search_params.dart';
import 'package:newspaper_app/domain/repository/news_repository_interface.dart';
import 'package:newspaper_app/domain/usecases/usecase_interface.dart';

class SearchNews implements IUseCase<List<NewsEntity>, NewsParams> {
  final INewsRepository _newsRepository;

  SearchNews(this._newsRepository);

  @override
  Future<Either<AppError, List<NewsEntity>>> call(NewsParams params) async {
    return await _newsRepository.searchNews(params.newsParams);
  }
}
