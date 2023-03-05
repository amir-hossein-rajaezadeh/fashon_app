import 'package:fashon_app/data/app_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../base/base_view_model.dart';

class CartListViewModel extends BaseViewModel {
  void increaseOrDecreaseItemToCarrtList(BaseViewModelOffline data,
      BuildContext context, bool isFromDetail, int index, bool isIncreasing) {
    if (isIncreasing) {
      if (isFromDetail) {
        itemOnCart.add(data);
        Navigator.pushNamed(context, "/cartList");
      } else {
        itemOnCart[index].value = itemOnCart[index].value + 1;
        if (kDebugMode) {
          print("item value is ${itemOnCart[index].value}");
        }
      }
    } else {
      if (itemOnCart[index].value == 1) {
        itemOnCart.removeWhere((element) => element.id == data.id);
      } else {
        itemOnCart[index].value = itemOnCart[index].value - 1;
      }
    }
    notifyListeners();
  }

  double doCalculation() {
    double total = 0.0;

    if (itemOnCart.isEmpty) {
      total = 0.0;
    } else {
      for (BaseViewModelOffline data in itemOnCart) {
        total = total + data.price * data.value;
      }
    }
    return total;
  }

  double doShipping() {
    double shipping = 0.0;
    if (itemOnCart.isEmpty) {
      shipping = 0.0;
      return shipping;
    } else if (itemOnCart.length <= 4) {
      shipping = 25.99;
      return shipping;
    } else {
      shipping = 88.99;
      return shipping;
    }
  }

  int calculateSubTotal() {
    int subTotal = 0;
    if (itemOnCart.isEmpty) {
      subTotal = 0;
    } else {
      for (BaseViewModelOffline data in itemOnCart) {
        subTotal = subTotal + data.price.round();
        subTotal = subTotal - 160;
      }
    }
    return subTotal < 0 ? 0 : subTotal;
  }

  void deleteItem(BaseViewModelOffline data) {
    itemOnCart.removeWhere((element) => element.id == data.id);
    notifyListeners();
  }
}

final cartrListViewModelProvider =
    ChangeNotifierProvider.autoDispose<CartListViewModel>(
  (ref) => CartListViewModel(),
);
