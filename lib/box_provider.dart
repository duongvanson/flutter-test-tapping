import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';
class Box{
  int value;
  Color color;

  Box(this.value, this.color);
}
class BoxProvider extends ChangeNotifier{

  List<Box> _data = List<Box>();
  int _select = -1;

  BoxProvider(){
   for(int i = 0; i < 15; i++){
     _data.add(Box(0, RandomColor().randomColor()));
   }
  }
  List<Box> get data => _data;

  int get select => _select;

  void setSelect(int value) {
    _select = value;
    notifyListeners();
  }
  void upValueBox(int index){
    _data[index].value++;
    notifyListeners();
  }
}