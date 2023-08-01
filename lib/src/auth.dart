import 'package:flutter/widgets.dart';

class AmicaAuth extends ChangeNotifier {
  bool _signedIn = false;
  bool get signedIn => _signedIn;

  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _signedIn = false;
    notifyListeners();
  }

  Future<bool> signIn(String username, String password) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));

    _signedIn = true;
    notifyListeners();
    return _signedIn;
  }

  @override
  bool operator ==(Object other) =>
      other is AmicaAuth && other._signedIn == _signedIn;

  @override
  int get hashCode => _signedIn.hashCode;
}

class AmicaAuthScope extends InheritedNotifier<AmicaAuth> {
  const AmicaAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static AmicaAuth of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AmicaAuthScope>()!.notifier!;
}
