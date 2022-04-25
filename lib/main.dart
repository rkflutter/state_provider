import 'package:flutter/material.dart';
import 'firstpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: wordpuzzle(),
  ),
  );
}

class wordpuzzle extends StatefulWidget {
  @override
  _wordpuzzleState createState() => _wordpuzzleState();
}

class _wordpuzzleState extends State<wordpuzzle> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    navigatetoHome();
  }

  Future<void> navigatetoHome() async {
    await Future.delayed(const Duration(seconds: 1), () {

    });
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => firstpage(),
        ));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(
       child: Image.asset("images/loading_screen.png",height: 250,width: 250,fit: BoxFit.fill,),
     ),
    );
  }




}
