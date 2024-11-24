import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/domain/repo/base_home_repo.dart';

class HomeRepoImpl implements BaseHomeRepo {
  BaseHomeRepo baseHomeRepo;
  HomeRepoImpl({required this.baseHomeRepo});
  @override
  Future<Either<Failure, HomeResponseEntity>> getHomeData() async {
    var either = await baseHomeRepo.getHomeData();

    return either.fold(
      (failure) => left(failure),
      (response) => right(response),
    );
  }
}
