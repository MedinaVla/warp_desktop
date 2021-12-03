import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

/// Repository interface for connect_warp
abstract class IConnectWarpRepository {
  ///Run  Process
  Future<Either<Failure, bool>> runProcess(String actionParams);
}
