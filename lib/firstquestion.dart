import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskcpl/answers.dart';
import 'package:taskcpl/question.dart';

class Questions extends StatefulWidget {
  static const routeNamed = 'first_question';
  const Questions({Key? key}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  @override
  Widget build(BuildContext context) {
    var index = Provider.of<Answers>(context).index;
    var answers =
        Provider.of<Answers>(context).content[index].entries.single.value;
    var questions =
        Provider.of<Answers>(context).content[index].entries.single.key;
    bool ischecked = Provider.of<Answers>(context, listen: false).check(index);
    return Scaffold(
        appBar: AppBar(
          title: const Text("The Quiz App"),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<Answers>(context, listen: false).reset();
                },
                icon: const Icon(Icons.replay_outlined))
          ],
          automaticallyImplyLeading: false,
          leading: index == 0
              ? null
              : IconButton(
                  onPressed: () {
                    if (index > 0) {
                      Provider.of<Answers>(context, listen: false).back(index);
                    }
                  },
                  icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                questions,
                style: const TextStyle(fontSize: 26),
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 20,
                ),
                itemCount: answers.length,
                itemBuilder: (_, i) => ChangeNotifierProvider.value(
                    value: answers[i], child: const Question()),
              ),
            ),
            MaterialButton(
                onPressed: () {
                  if (index == 2) {
                    Navigator.pushNamed(context, 'result');
                  } else {
                    Provider.of<Answers>(context, listen: false).next();
                  }
                },
                minWidth: double.infinity,
                color: ischecked ? Colors.blue : null,
                child: ischecked
                    ? const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      )
                    : null)
          ],
        ));
  }
}
