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

      return warpStats();
    } catch (e) {
      throw ServerException();
    }
  }

  ///Return true  is  connected
  Future<bool> warpStats() async {
    try {
      final rs = await Process.run('warp-cli', ['warp-stats']);
      log(rs.stdout);
      final result = rs.stdout.toString();
      log(result);
      if (result.startsWith('Error')) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
