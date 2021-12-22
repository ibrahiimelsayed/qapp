import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskcpl/answers.dart';

class Results extends StatelessWidget {
  static const routeNamed = 'result';
  const Results({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int result = Provider.of<Answers>(context, listen: false).results();

    String text(int r) {
      String resultText;
      if (r <= 8) {
        resultText = 'You are awesome and innocent!';
      } else if (r <= 12) {
        resultText = 'Pretty likeable!';
      } else if (r <= 16) {
        resultText = 'You are ... strange?!';
      } else {
        resultText = 'You are so bad!';
      }
      return resultText;
    }

    return WillPopScope(
      onWillPop: () async {
        Provider.of<Answers>(context, listen: false).reset();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("The Quiz App"),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<Answers>(context, listen: false).reset();
                  Navigator.popAndPushNamed(context, 'first_question');
                },
                icon: const Icon(Icons.replay_outlined))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '$result',
                    style: const TextStyle(fontSize: 120),
                  ),
                  Text(
                    text(result),
                    style: const TextStyle(fontSize: 30),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
