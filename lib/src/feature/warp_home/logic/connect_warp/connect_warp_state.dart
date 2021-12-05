import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_warp_state.freezed.dart';

extension ConnectingState on ConnectWarpState {
  bool get isConnectign => this is _Connecting;
}

@freezed
abstract class ConnectWarpState with _$ConnectWarpState {
  /// Initial/default state
  const factory ConnectWarpState.initial() = _Initial;

  /// Data is loading state
  const factory ConnectWarpState.connecting() = _Connecting;

  /// Data is present state
  const factory ConnectWarpState.connected(bool connected) = _Connected;

  /// Error when loading data state
  const factory ConnectWarpState.error([String? message]) = _Error;
}
