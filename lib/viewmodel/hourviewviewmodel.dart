import 'package:flutter/cupertino.dart';

class HourViewViewModel with ChangeNotifier{
  int _selectedHour=12;
  int get selectedHour=>_selectedHour;


  set setSelectedHour(int currentSelectedHour){
    _selectedHour=currentSelectedHour;
    notifyListeners();
  }


}