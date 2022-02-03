import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CartItem extends ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  int _itemCount = 0;
  int get itemCount => _itemCount;
  set itemCount(int addtocart) {
    _itemCount = addtocart;
    notifyListeners();
  }

  List _cartList = [];
  int _total = 0;
  int get total => _total;
  set total(int totalprice) {
    _total = totalprice;
    notifyListeners();
  }

  List get cartList => _cartList;
  set cartList(List cartListParameter) {
    _cartList = cartListParameter;
    notifyListeners();
  }

  addCartItem(Map productInfo, int quantity, bool isXlarge) async {
    final SharedPreferences prefs = await _prefs;
    print(cartList);
    if (_cartList.any((element) => element["id"] == productInfo["id"])) {
      removeCartItem(productInfo, isXlarge);
      addCartItem(productInfo, quantity, isXlarge);
    } else {
      itemCount++;
      productInfo["quantity"] = quantity;
      productInfo["xlarge"] = isXlarge;
      if (isXlarge == true) {
        total += int.parse(productInfo["pricemax"].toString()) *
            int.parse(productInfo["quantity"].toString());

        _cartList.add(productInfo);
      } else {
        total += int.parse(productInfo["price"].toString()) *
            int.parse(productInfo["quantity"].toString());
        _cartList.add(productInfo);
      }
    }

    notifyListeners();
    prefs.setString("cartList", jsonEncode(cartList));
  }

  removeCartItem(Map productInfo, bool isXlarge) async {
    final SharedPreferences prefs = await _prefs;
    var filter = [];
    itemCount--;
    cartList.forEach((e) {
      if (e["id"] == productInfo["id"]) {
        if (productInfo["xlarge"] == true) {
          total -= int.parse(e["pricemax"].toString()) *
              int.parse(e["quantity"].toString());
        } else {
          total -= int.parse(e["price"].toString()) *
              int.parse(e["quantity"].toString());
        }
      } else {
        filter.add(e);
      }
    });
    cartList = filter;
    notifyListeners();
    prefs.setString("cartList", jsonEncode(cartList));
  }
}
