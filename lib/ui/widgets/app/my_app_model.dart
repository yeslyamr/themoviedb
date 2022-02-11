import 'package:themoviedb/domain/data_provider/session_data_provider.dart';

class MyAppModel {
  final _sessionDataProvider = SessionDataProvidr();
  var _isAuth = false;
  bool get isAuth => _isAuth;

  Future<void> checkAuth() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    _isAuth = sessionId != null;
  }
}
