import 'package:flutter/cupertino.dart';

class MinutesViewViewModel with ChangeNotifier{

  int _selectedMinute=1;
  int get selectedMinute=>_selectedMinute;

  set setSelectedMinute(int currentSelectedMinute){
    _selectedMinute=currentSelectedMinute;
    notifyListeners();
  }

}