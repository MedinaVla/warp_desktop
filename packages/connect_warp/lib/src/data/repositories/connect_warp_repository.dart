import 'package:errors/src/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../domain/domain.dart';

import '../datasources/local_data_source.dart';

/// ConnectWarp repository implementation
class ConnectWarpRepository implements IConnectWarpRepository {
  /// ConnectWarp repository constructor
  ConnectWarpRepository({
    required this.localDataSource,
  });

  final LocalDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> runProcess(String actionParams) {
    throw UnimplementedError();
  }
}
