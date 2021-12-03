part of 'connect_warp_provider.dart';

/// Defines all the ConnectWarp logic the app will use
class ConnectWarpNotifier extends StateNotifier<ConnectWarpState> {
  /// Base constructor expects StateNotifier use_cases to
  /// read its usecases and also defines inital state
  ConnectWarpNotifier({required ConnectWarp useCase, required String action})
      : _useCase = useCase,
        _action = action,
        super(ConnectWarpState.initial());

  final ConnectWarp _useCase;
  final String _action;

  Future<void> connectWarp() async {
    state = ConnectWarpState.connecting();

    final result = await _useCase(ConnectWarpParams(actionParams: _action));
    result.fold((error) => state = ConnectWarpState.error(),
        (connect) => state = ConnectWarpState.connected(connect));
  }
}
