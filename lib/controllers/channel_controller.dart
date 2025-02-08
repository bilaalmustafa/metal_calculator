import 'package:flutter/material.dart';

class ChannelController extends ChangeNotifier {
  int _selectedIndex = 0;
  String selectedMaterial = "Steel";
  String selectedUnitWidth = "mm";
  String selectedUnitLength = "mm";

  TextEditingController sideAController = TextEditingController();
  TextEditingController sideBController = TextEditingController();
  TextEditingController thicknessTController = TextEditingController();
  TextEditingController thicknessSController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController piecesController = TextEditingController();
  TextEditingController weightController = TextEditingController();
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
