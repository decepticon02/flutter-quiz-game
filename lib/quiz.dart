import 'package:flutter/material.dart';
import 'package:quiz_game/questions_screen.dart';
import 'package:quiz_game/start_screen.dart';
import 'package:quiz_game/data/questions.dart';
class Quiz extends StatefulWidget{
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

   List<String> selectedAnswers = [];

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        selectedAnswers =[];
        activeScreen =StartScreen(switchScreen);

      });
    }
  }


  Widget? activeScreen;
 @override
  void initState() {
      activeScreen =StartScreen(switchScreen);
    super.initState();
  }
 
  void switchScreen(){
    setState(() {
      activeScreen =  QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }
    )  ;
  }




  @override
  Widget build(context){
    return
      MaterialApp(
        home: Scaffold(
          body: Container(
            decoration: const  BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple,
                  Colors.blue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child:  activeScreen,
          ) ,
        ),
      );

  }
}