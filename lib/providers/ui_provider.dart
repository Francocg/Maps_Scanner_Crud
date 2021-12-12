import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt(int value) {
    this._selectedMenuOpt = value;
    notifyListeners();
  }
}
