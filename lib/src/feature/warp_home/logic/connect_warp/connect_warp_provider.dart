import 'package:connect_warp/connect_warp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connect_warp_state.dart';
export 'connect_warp_state.dart';

part 'connect_warp_state_notifier.dart';

/// Provider to use the ConnectWarpStateNotifier
final connectWarpNotifierProvider =
    StateNotifierProvider.autoDispose<ConnectWarpNotifier, ConnectWarpState>(
  (ref) => ConnectWarpNotifier(
      connectOrDisconnectWarpUseCase: ref.watch(_connectUseCaseProvider),
      getConnectionStatusUseCase: ref.watch(_getConnectionStatusProvider),
      action: ref.watch(connectOrDisconnectProvider).state),
);

/// Repositories Providers
final _repositoryProvider = Provider<IConnectWarpRepository>(
    (_) => ConnectWarpRepository(localDataSource: ProcessDataSource()));

/// Use Cases Providers
final _connectUseCaseProvider = Provider<ConnectWarp>(
    (ref) => ConnectWarp(repository: ref.watch(_repositoryProvider)));

final _getConnectionStatusProvider = Provider<GetConnectionStatus>(
    (ref) => GetConnectionStatus(repository: ref.watch(_repositoryProvider)));

final switcherResultProvider = StateProvider<bool>((_) => false);

final connectOrDisconnectProvider = StateProvider<String>((ref) {
  final switcher = ref.watch(switcherResultProvider).state;
  switch (switcher) {
    case true:
      return 'connect';

    default:
      return 'disconnect';
  }
});
