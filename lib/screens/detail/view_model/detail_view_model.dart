import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/base_view_model.dart';

class DetailViewModel extends BaseViewModel {
  int _selectedSize = 3;
  int _selectedColor = 3;

   

  setSelectedSize(int value) {
    _selectedSize = value;
    notifyListeners();
  }

  int getSelectedSize() {
    return _selectedSize;
  }

    setSelectedColor(int value) {
    _selectedColor = value;
    notifyListeners();
  }

  int getSelectedColor() {
    return _selectedColor;
  }
}

final detailViewModelProvider =
    ChangeNotifierProvider.autoDispose<DetailViewModel>(
  (ref) => DetailViewModel(),
);
