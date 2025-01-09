import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';

abstract class BaseHomeRemoteDataSource {
  Future<Either<Failure, HomeResponseEntity>> getHomeData();
}
