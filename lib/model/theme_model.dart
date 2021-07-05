import 'package:flutter/material.dart';
import '/constants.dart';

class ThemeModel extends ChangeNotifier{
  ThemeData _selectedTheme = kDarkTheme;

  ThemeData getTheme(){
    return this._selectedTheme;
  }
  bool isDarkTheme(){
    if( _selectedTheme==kDarkTheme) return true;
    return false;
  }

  void  changeTheme(){
    if(_selectedTheme==kLightTheme){
      _selectedTheme = kDarkTheme;         //applying dark theme

    }else{
      _selectedTheme = kLightTheme;       //applying light theme

    }
    notifyListeners();
  }
}