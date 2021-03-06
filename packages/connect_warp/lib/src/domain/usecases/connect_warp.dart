import 'package:connect_warp/src/core/usecase.dart';
import 'package:connect_warp/src/domain/domain.dart'
    show IConnectWarpRepository;
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

///Connect  Warp
class ConnectWarp extends UseCase<bool, ConnectWarpParams> {
  ///UseCase  constructor
  ConnectWarp({required this.repository});

  ///Repisitory
  final IConnectWarpRepository repository;

  /// Callable class method
  @override
  Future<Either<Failure, bool>> call(ConnectWarpParams params) async {
    return repository.runProcess(params.actionParams);
  }
}

///Params of  ConnectWarp
class ConnectWarpParams {
  ///Constructor
  ConnectWarpParams({required this.actionParams});

  ///Action connect or  disconnect
  final String actionParams;
}
