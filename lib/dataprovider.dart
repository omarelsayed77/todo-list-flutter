// ignore_for_file: list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class dataprovider with ChangeNotifier {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  List<String> mydata = [];
  List<bool> checkBoxsValues = [];
  dataprovider() {
    getalltasks();
  }
  changeCheckBoxValue(int index) {
    checkBoxsValues[index] = !checkBoxsValues[index];
    notifyListeners();
  }

  getalltasks() {
    prefs.then((value) async {
      var returneddata = await value.getStringList('tasks');
      mydata = returneddata!;
      for (int i = 0; i < mydata.length; i++) {
        checkBoxsValues.add(false);
      }
      notifyListeners();
    });
  }

  addtosharedpreference(String task) {
    prefs.then((value) {
      mydata.add(task);
      value.setStringList('tasks', mydata);
      getalltasks();
      notifyListeners();
    });
  }

  delllllllll(int index) {
    mydata.removeAt(index);
    prefs.then((value) {
      value.setStringList("tasks", mydata);
    });
    notifyListeners();
  }
}
