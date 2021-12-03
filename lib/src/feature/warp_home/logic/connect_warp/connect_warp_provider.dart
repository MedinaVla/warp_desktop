import 'dart:developer';

import 'package:connect_warp/connect_warp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'connect_warp_state.dart';

part 'connect_warp_state_notifier.dart';

/// Provider to use the ConnectWarpStateNotifier
final connectWarpNotifierProvider =
    StateNotifierProvider<ConnectWarpNotifier, ConnectWarpState>(
  (ref) => ConnectWarpNotifier(
      useCase: ref.watch(connectUseCaseProvider),
      action: ref.watch(actionProvider).state),
);

/// Repositories Providers
final _repositoryProvider = Provider<IConnectWarpRepository>(
    (_) => ConnectWarpRepository(localDataSource: ProcessDataSource()));

/// Use Cases Providers
final connectUseCaseProvider = Provider<ConnectWarp>(
    (ref) => ConnectWarp(repository: ref.watch(_repositoryProvider)));

final switcherResultProvider = StateProvider<bool>((_) => false);

final actionProvider = StateProvider<String>((ref) {
  final switcher = ref.watch(switcherResultProvider).state;
  switch (switcher) {
    case true:
      return 'connect';

    default:
      return 'disconnect';
  }
});
