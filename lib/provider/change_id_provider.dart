import 'package:flutter/material.dart';

class ChangeIdProvider  extends ChangeNotifier{

  int selectedIndex = 0;
   
   changeIndex(int index)
   {
    selectedIndex = index;
    notifyListeners();
   }
}