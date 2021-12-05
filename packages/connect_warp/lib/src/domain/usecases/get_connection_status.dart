import 'package:connect_warp/connect_warp.dart';
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

///Get Connection Status
class GetConnectionStatus {
  ///Constructor
  GetConnectionStatus({required IConnectWarpRepository repository})
      : _repository = repository;

  final IConnectWarpRepository _repository;

  ///Function Call
  Future<Either<Failure, bool>> call() => _repository.getConnectionStatus();
}
