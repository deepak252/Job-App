import 'package:flutter/material.dart';
import '/constants.dart';

class ThemeModel extends ChangeNotifier{
  ThemeData _selectedTheme = kLightTheme;
  Color _cardColor=kCardColorLight;
  Color _textColor = kTextColorLight;

  ThemeData getTheme(){
    return this._selectedTheme;
  }
  Color getCardColor(){
    return _cardColor;
  }
  Color getTextColor() {
    return _textColor;
  }
  bool isDarkTheme(){
    if( _selectedTheme==kDarkTheme) return true;
    return false;
  }

  void  changeTheme(){
    if(_selectedTheme==kLightTheme){
      _selectedTheme = kDarkTheme;         //applying dark theme
      _cardColor = kCardColorDark;
      _textColor=kTextColorDark;
    }else{
      _selectedTheme = kLightTheme;       //applying light theme
      _cardColor = kCardColorLight;
      _textColor=kTextColorLight;
    }
    notifyListeners();
  }
}