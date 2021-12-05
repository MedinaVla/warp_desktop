part of 'connect_warp_provider.dart';

/// Defines all the ConnectWarp logic the app will use
class ConnectWarpNotifier extends StateNotifier<ConnectWarpState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  ConnectWarpNotifier(
      {required ConnectWarp connectOrDisconnectWarpUseCase,
      required GetConnectionStatus getConnectionStatusUseCase,
      required String action})
      : _connectOrDisconnectWarpUseCase = connectOrDisconnectWarpUseCase,
        _getConnectionStatusUseCase = getConnectionStatusUseCase,
        _action = action,
        super(ConnectWarpState.initial()) {
    connectWarp();
  }

  final ConnectWarp _connectOrDisconnectWarpUseCase;
  final GetConnectionStatus _getConnectionStatusUseCase;
  final String _action;

  Future<void> connectWarp() async {
    state = ConnectWarpState.connecting();

    final result = await _connectOrDisconnectWarpUseCase(
        ConnectWarpParams(actionParams: _action));
    result.fold((error) => state = ConnectWarpState.error(),
        (connect) => state = ConnectWarpState.connected(connect));
  }

  Future<void> getConnectionStatusCall() async {
    final result = await _getConnectionStatusUseCase();
    result.fold((error) => state = ConnectWarpState.error(),
        (connect) => state = ConnectWarpState.connected(connect));
  }
}
