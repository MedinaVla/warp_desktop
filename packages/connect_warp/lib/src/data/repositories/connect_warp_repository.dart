import 'package:connect_warp/src/data/datasources/local_data_source.dart';
import 'package:connect_warp/src/domain/repositories/iconnect_warp_repository.dart';
import 'package:errors/errors.dart';
import 'package:errors/src/failures.dart';
import 'package:dartz/dartz.dart';

/// ConnectWarp repository implementation
class ConnectWarpRepository implements IConnectWarpRepository {
  /// ConnectWarp repository constructor
  ConnectWarpRepository({
    required this.localDataSource,
  });

  ///ProcessDataSource
  final ProcessDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> runProcess(String actionParams) async {
    try {
      final result = await localDataSource.runProcess(actionParams);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}
