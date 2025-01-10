import 'package:dartz/dartz.dart';
import 'package:docdoc/core/error/failure.dart';
import 'package:docdoc/features/home/data/data_sources/remote/base_home_remote_data_source.dart';
import 'package:docdoc/features/home/domain/entities/home_response_entity.dart';
import 'package:docdoc/features/home/domain/repo/base_home_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseHomeRepo)
class HomeRepoImpl implements BaseHomeRepo {
  BaseHomeRemoteDataSource baseHomeDataSource;
  HomeRepoImpl({required this.baseHomeDataSource});
  @override
  Future<Either<Failure, HomeResponseEntity>> getHomeData() async {
    var either = await baseHomeDataSource.getHomeData();

    return either.fold(
      (failure) => left(failure),
      (response) => right(response),
    );
  }
}
