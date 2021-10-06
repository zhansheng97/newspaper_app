import 'package:dartz/dartz.dart';
import 'package:newspaper_app/domain/entities/app_error.dart';
import 'package:newspaper_app/domain/entities/news_entities.dart';
import 'package:newspaper_app/domain/entities/no_params.dart';
import 'package:newspaper_app/domain/repository/news_repository_interface.dart';
import 'package:newspaper_app/domain/usecases/usecase_interface.dart';

class GetHeadLineNews extends IUseCase<List<NewsEntity>, NoParams> {
  final INewsRepository _newsRepository;

  GetHeadLineNews(this._newsRepository);

  @override
  Future<Either<AppError, List<NewsEntity>>> call(NoParams params) async {
    return await _newsRepository.getHeadlineNews();
  }
}
