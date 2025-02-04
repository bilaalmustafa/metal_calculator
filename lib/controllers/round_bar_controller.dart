import 'package:flutter/material.dart';

class RoundBarController extends ChangeNotifier {
  int _selectedIndex = 0;
  String selectedMaterial = "Steel";
  String selectedUnitWidth = "mm";
  String selectedUnitLength = "mm";

  TextEditingController widthController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController piecesController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController densityController = TextEditingController();

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    if (index != _selectedIndex) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}
