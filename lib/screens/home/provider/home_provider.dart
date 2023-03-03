import 'package:flutter/cupertino.dart';
import 'package:insert_app/screens/home/model/stdmodel.dart';

class Homeprovider extends ChangeNotifier
{
  List<stdmodel> l1=[];

  void adddata(stdmodel s1)
  {
    l1.add(s1);
    notifyListeners();
  }
  void delet(int index)
  {
    l1.removeAt(index);
    notifyListeners();
  }
  void update(int index,stdmodel s1)
  {
    l1[index]=s1;
    notifyListeners();
  }
}