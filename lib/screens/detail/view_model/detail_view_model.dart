import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:collection/collection.dart';

import '../../../base/base_view_model.dart';
import '../../../data/app_data.dart';

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

  void addItemToCarrtList(BaseViewModelOffline data, BuildContext context,
      bool isFromDetail, int index) {
    if (isFromDetail) {
      if (itemOnCart.isNotEmpty) {
        BaseViewModelOffline itemId =
            mainList.firstWhere((element) => element.id == data.id);
        BaseViewModelOffline? isExist =
            itemOnCart.firstWhereOrNull((element) => element.id == itemId.id);
        if (isExist?.id == data.id) {
          Navigator.pushNamed(context, "/cartList");
        } else {
          itemOnCart.add(data);
          if (data.value == 0) {
            data.value = 1;
          }
          Navigator.pushNamed(context, "/cartList");
        }
      } else {
        itemOnCart.add(data);
        Navigator.pushNamed(context, "/cartList");
      }
    } else {
      itemOnCart[index].value + 1;
    }
    notifyListeners();
  }

 
}

final detailViewModelProvider =
    ChangeNotifierProvider.autoDispose<DetailViewModel>(
  (ref) => DetailViewModel(),
);
