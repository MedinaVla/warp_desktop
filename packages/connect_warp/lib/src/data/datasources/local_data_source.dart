import 'dart:developer';
import 'dart:io';

import 'package:errors/errors.dart';

///Interface  DataSource
abstract class ILocalDataSource {
  ///Run  Process
  Future<bool> runProcess(String action);
}

///Call run commands
class ProcessDataSource implements ILocalDataSource {
  @override
  Future<bool> runProcess(String action) async {
    try {
      log('ProcessDataSource $action');
      await Process.run('warp-cli', [action]);
      if (action == 'connect') {
        await Future<dynamic>.delayed(const Duration(seconds: 2));
      }

      return warpStats();
    } catch (e) {
      throw ServerException();
    }
  }

  ///Return true  is  connected
  Future<bool> warpStats() async {
    try {
      final rs = await Process.run('warp-cli', ['warp-stats']);
      final result = rs.stdout.toString();
      if (result.startsWith('Error')) {
        log('No conecto');
        return false;
      } else {
        log('Se conecto');

        return true;
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
