import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/domain/repo/base_home_repo.dart';

class HomeUseCase {
  BaseHomeRepo baseHomeRepo;

  HomeUseCase({required this.baseHomeRepo});

  Future<Either<Failure, HomeResponseEntity>> getSpeciallyDoctors() {
    return baseHomeRepo.getHomeData();
  }
}
