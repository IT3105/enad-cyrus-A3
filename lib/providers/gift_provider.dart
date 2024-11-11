// providers/gift_provider.dart
import 'package:flutter/material.dart';
import '../models/gift.dart';

class GiftProvider with ChangeNotifier {
  List<Gift> _gifts = [];

  List<Gift> get gifts => _gifts;

  void addGift(Gift gift) {
    _gifts.add(gift);
    notifyListeners();
  }

  void editGift(String id, Gift updatedGift) {
    final index = _gifts.indexWhere((gift) => gift.id == id);
    if (index != -1) {
      _gifts[index] = updatedGift;
      notifyListeners();
    }
  }

  void deleteGift(String id) {
    _gifts.removeWhere((gift) => gift.id == id);
    notifyListeners();
  }
}
