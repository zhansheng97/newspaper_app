import 'package:dartz/dartz.dart';
import 'package:newspaper_app/domain/entities/app_error.dart';

abstract class IUseCase<Type, Params> {
  Future<Either<AppError, Type>> call(Params params);
}
