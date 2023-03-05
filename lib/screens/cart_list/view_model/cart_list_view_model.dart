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
      itemOnCart[index].value = itemOnCart[index].value - 1;
      if (itemOnCart[index].value == 0) {
        itemOnCart.removeWhere((element) => element.id == data.id);
      }
    }

    notifyListeners();
  }
}

final cartrListViewModelProvider =
    ChangeNotifierProvider.autoDispose<CartListViewModel>(
  (ref) => CartListViewModel(),
);
