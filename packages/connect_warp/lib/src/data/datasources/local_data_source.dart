abstract class ILocalDataSource {
  Future<bool> runProcess(String action);
}

class LocalDataSource implements ILocalDataSource {
  @override
  Future<bool> runProcess(String action) {
    throw UnimplementedError();
  }
}
