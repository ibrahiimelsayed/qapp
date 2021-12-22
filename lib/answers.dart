// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';

class Answer with ChangeNotifier {
  final int id;
  final String ans;
  final int score;
  bool isSelected;
  Answer(
      {required this.id,
      required this.ans,
      required this.score,
      this.isSelected = false});
}

class Answers with ChangeNotifier {
  List<Map<String, List<Answer>>> content = [
    {
      'who is your favorite instructor?': [
        Answer(id: 1, ans: 'Matarawy', score: 1),
        Answer(id: 1, ans: 'Matarawy', score: 1),
        Answer(id: 1, ans: 'Matarawy', score: 1),
        Answer(id: 1, ans: 'Matarawy', score: 1),
      ]
    },
    {
      'what is your favorite color?': [
        Answer(id: 2, ans: 'black', score: 10),
        Answer(id: 2, ans: 'red', score: 5),
        Answer(id: 2, ans: 'green', score: 3),
        Answer(id: 2, ans: 'white', score: 1),
        Answer(id: 2, ans: 'yellow', score: 1),
      ]
    },
    {
      'what is your favorite animal?': [
        Answer(id: 3, ans: 'rabbit', score: 3),
        Answer(id: 3, ans: 'snake', score: 11),
        Answer(id: 3, ans: 'elephant', score: 5),
        Answer(id: 3, ans: 'lion', score: 9),
      ]
    },
  ];
  List<Answer> selected = [];

  int index = 0;

  int results() {
    int sum = 0;
    if (selected.isNotEmpty) {
      for (var i = 0; i < selected.length; i++) {
        sum += selected[i].score;
      }
    } else {
      sum = 0;
    }

    return sum;
  }

  void reset() {
    selected.clear();
    index = 0;
    for (var i = 0; i < content.length; i++) {
      content[i].forEach((key, value) {
        // ignore: avoid_function_literals_in_foreach_calls
        value.forEach((element) {
          element.isSelected = false;
        });
      });
    }
    notifyListeners();
  }

  void addtoselected(Answer a) {
    selected.add(a);
    notifyListeners();
  }

  void removeformselected(Answer a) {
    selected.remove(a);
    notifyListeners();
  }

  bool check(int id) {
    for (var i = 0; i < selected.length; i++) {
      if (selected[i].id == id + 1) {
        return true;
      }
    }
    return false;
  }

  void next() {
    index++;
    notifyListeners();
  }

  void back(int i) {
    selected.removeWhere((element) => element.id == i + 1);
    index--;
    notifyListeners();
  }
}
