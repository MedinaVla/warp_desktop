import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

/// Repository interface for connect_warp
// ignore: one_member_abstracts
abstract class IConnectWarpRepository {
  ///Run  Process
  Future<Either<Failure, bool>> runProcess(String actionParams);

  ///Get connection Status
  Future<Either<Failure, bool>> getConnectionStatus();
}
