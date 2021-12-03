import 'package:connect_warp/src/domain/domain.dart'
    show IConnectWarpRepository;
import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

///Connect  or  Disconnect   Warp
class ConnectOrDisconnectWarp {
  ///UseCase  constructor
  ConnectOrDisconnectWarp({required this.repository});

  ///Repisitory
  final IConnectWarpRepository repository;

  /// Callable class method
  Future<Either<Failure, Object>> call() async {
    /// TODO: Call specific repository method
  }
}
