import 'package:flutter/foundation.dart';

class PageInfos extends ChangeNotifier {
  int _selectedItemIndex = 0;

  int get GetSelectedItemIndex {
    return _selectedItemIndex;
  }

  void setSelectedItemIndex(x) {
    _selectedItemIndex = x;
    notifyListeners();
  }
}
