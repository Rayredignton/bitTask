import 'package:flutter/material.dart';

class BitProvider extends ChangeNotifier {
  bool _loading = false;
  bool _complete = false;
  bool _minNumbers = false;
  bool _walletDropdown = false;
  bool _buttonColor = false;
  bool _buttonColor2 = false;
  bool _walletCreated = false;
  bool _isTyping = false;
  bool _containNumber = false;
  bool _containCharacter = false;
  bool _tap = false;

  bool get tap => _tap;

  bool get containCharacter => _containCharacter;
  bool get containNumber => _containNumber;
  bool get minNumbers => _minNumbers;
  bool get isTyping => _isTyping;
  bool get walletCreated => _walletCreated;
  bool get loading => _loading;
  bool get complete => _complete;

  bool get walletDropdown => _walletDropdown;
  bool get buttonColor => _buttonColor;
  bool get buttonColor2 => _buttonColor;

  setTap(bool tap) {
    _tap = tap;
    notifyListeners();
  }

  setContainCharacter(bool character) {
    _containCharacter = character;
    notifyListeners();
  }

  setContainNumber(bool containNumber) {
    _containNumber = containNumber;
    notifyListeners();
  }

  setMinNumbers(bool minNumbers) {
    _minNumbers = minNumbers;
    notifyListeners();
  }

  setIsTyping(bool typing) {
    _isTyping = typing;
    notifyListeners();
  }

  set setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  set setCompleted(bool complete) {
    _complete = complete;
    notifyListeners();
  }

  setwalletDropdown(bool? dropdown) {
    _walletDropdown = dropdown!;
    notifyListeners();
  }

  setbuttonColor(bool? buttonColor) {
    _buttonColor = buttonColor!;
    notifyListeners();
  }

  setwalletCreated(bool? walletCreated) {
    _walletCreated = walletCreated!;
    notifyListeners();
  }

  setbuttonColor2(bool? buttonColor2) {
    _buttonColor2 = buttonColor2!;
    notifyListeners();
  }
}
