import 'package:meta/meta.dart';

import '../../domain/domain.dart';

import '../datasources/local_data_source.dart';
import '../datasources/remote_data_source.dart';

/// ConnectWarp repository implementation
class ConnectWarpRepository implements IConnectWarpRepository {
  /// ConnectWarp repository constructor
  ConnectWarpRepository({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  // TODO: Implement [IConnectWarpRepository] methods
}
