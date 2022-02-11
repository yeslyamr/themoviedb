import 'package:flutter/cupertino.dart';
import 'package:themoviedb/domain/api_client/api_client.dart';
import 'package:themoviedb/domain/data_provider/session_data_provider.dart';
import 'package:themoviedb/ui/navigation/main_navigation.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final sessionDataProvider = SessionDataProvidr();

  final loginTextController = TextEditingController(text: 'yeslyamr');
  final passwordTextController = TextEditingController(text: 'adidas1nike1');

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  bool _isAuthProgress = false;
  bool get canStartAuth => !_isAuthProgress;
  bool get isAuthProgress => _isAuthProgress;

  Future<void> auth(BuildContext context) async {
    final username = loginTextController.text;
    final password = passwordTextController.text;

    if (username.isEmpty || password.isEmpty) {
      _errorMessage = 'text something you idiot';
      notifyListeners();
      return;
    }

    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try {
      sessionId = await _apiClient.auth(username: username, password: password);
    } on ApiClientException catch (e) {
      switch (e.type) {
        case ApiClientExceptionType.network:
          _errorMessage =
              'Server is unavailable. Please, check your internet connection';
          break;
        case ApiClientExceptionType.auth:
          _errorMessage = 'Wrong username or password';
          break;
        case ApiClientExceptionType.other:
          _errorMessage = 'Oopsie.. try again';
          break;
      }
    } catch (e) {
      _errorMessage = 'Oopsie.. try again';
    }

    _isAuthProgress = false;
    if (_errorMessage != null || sessionId == null) {
      notifyListeners();
      return;
    } else {
      await sessionDataProvider.setSessionId(sessionId);
      Navigator.of(context).pushNamedAndRemoveUntil(
          MainNavigationRouteNames.mainScreen, (_) => false);
    }
  }
}

// class AuthModelProvider extends InheritedNotifier {
//   final AuthModel model;

//   const AuthModelProvider(
//       {Key? key, required this.model, required Widget child})
//       : super(key: key, child: child, notifier: model);

//   static AuthModelProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<AuthModelProvider>();
//   }

//   static AuthModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<AuthModelProvider>()
//         ?.widget;
//     return widget is AuthModelProvider ? widget : null;
//   }
// }
