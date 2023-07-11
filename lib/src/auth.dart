import 'package:flutter/widgets.dart';

class MaiterAuth extends ChangeNotifier {
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
      other is MaiterAuth && other._signedIn == _signedIn;

  @override
  int get hashCode => _signedIn.hashCode;
}

class MaiterAuthScope extends InheritedNotifier<MaiterAuth> {
  const MaiterAuthScope({
    required super.notifier,
    required super.child,
    super.key,
  });

  static MaiterAuth of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<MaiterAuthScope>()!.notifier!;
}
