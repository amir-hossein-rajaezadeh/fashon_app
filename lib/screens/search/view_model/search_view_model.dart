import 'package:flutter/cupertino.dart';
import 'package:fashon_app/data/app_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';
import '../../../base/base_view_model.dart';

class SearchViewModel extends BaseViewModel {
  final TextEditingController _controller = TextEditingController();
  bool isFirstTry = true;
  TextEditingController getSearchTextContrrollerValue() {
    return _controller;
  }

  void clearSearchTextField() {
    _controller.text = "";
    FocusManager.instance.primaryFocus?.unfocus();
    notifyListeners();
  }

  void searchFunction(String searchValue) {
    itemSearchList = mainList
        .where(
          (element) => element.name.toLowerCase().contains(searchValue),
        )
        .toList();

    notifyListeners();
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

final searchViewModelProvider =
    ChangeNotifierProvider.autoDispose<SearchViewModel>(
  (ref) => SearchViewModel(),
);
