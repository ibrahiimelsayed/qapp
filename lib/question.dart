import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskcpl/answers.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  @override
  Widget build(BuildContext context) {
    var answer = Provider.of<Answer>(context);
    return MaterialButton(
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Checkbox(
              value: answer.isSelected,
              onChanged: (bool? newValue) {
                setState(() {
                  answer.isSelected = !answer.isSelected;
                  answer.isSelected
                      ? Provider.of<Answers>(context, listen: false)
                          .addtoselected(answer)
                      : Provider.of<Answers>(context, listen: false)
                          .removeformselected(answer);
                });
              }),
          Text(
            answer.ans,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
      minWidth: double.infinity,
      color: Colors.red,
    );
  }
}
