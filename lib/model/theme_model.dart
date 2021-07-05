import 'package:flutter/material.dart';
import '/constants.dart';

class ThemeModel extends ChangeNotifier{
  ThemeData _selectedTheme = kLightTheme;
  Color _cardColor=kCardColorLight;

  ThemeData getTheme(){
    return this._selectedTheme;
  }
  Color getCardColor(){
    return _cardColor;
  }
  bool isDarkTheme(){
    if( _selectedTheme==kDarkTheme) return true;
    return false;
  }

  void  changeTheme(){
    if(_selectedTheme==kLightTheme){
      _selectedTheme = kDarkTheme;         //applying dark theme
      _cardColor=kCardColorDark;
    }else{
      _selectedTheme = kLightTheme;       //applying light theme
      _cardColor=kCardColorLight;
    }
    notifyListeners();
  }
}