import 'package:flutter/cupertino.dart';
import 'package:flutterend/model/control.dart';

class UiProvider extends ChangeNotifier {
  bool showPassword = false;
  Control _controls = Control();
  bool _paid = false;

  bool loading = false;
  bool get isLoading => loading;
   bool get paid => _paid;

  Control get controls => _controls;

  void hasPaid(bool pay) {
    _paid = pay;
    notifyListeners();
  }

  Future<void> updateControl(Control control) async {
    _controls = control;
    notifyListeners();
  }

  void showPass(bool val) {
    showPassword = val;
    notifyListeners();
  }

  Future<bool> load(bool isload) async {
    if (isload) {
      loading = true;
      notifyListeners();
      return true;
    } else {
      loading = false;
      notifyListeners();
      return false;
    }
  }
}
