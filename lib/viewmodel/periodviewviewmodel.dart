import 'package:flutter/cupertino.dart';

class PeriodViewViewModel with ChangeNotifier{
  String _selectedPeriod="AM";
  String get selectedPeriod => _selectedPeriod;

  set setSelectedPeriod(String currentSelectedPeriod){
    _selectedPeriod=currentSelectedPeriod;
    notifyListeners();
  }

}