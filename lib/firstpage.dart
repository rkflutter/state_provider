import 'package:flutter/material.dart';
import 'package:wordpuzzleonepic/secondpage.dart';

class firstpage extends StatefulWidget {
  @override
  _firstpageState createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return secondpage();
                }));
              },
              child: Container(
                  child: Image.asset(
                "images/croup_1.png",
                height: 120,
                width: double.infinity,
                fit: BoxFit.fill,
              )
              )),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return secondpage();
              }));
            },
            child: Container(
                child: Image.asset(
              "images/croup_2.png",
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return secondpage();
              }));
            },
            child: Container(
                child: Image.asset(
              "images/croup_3.png",
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return secondpage();
              }));
            },
            child: Container(
                child: Image.asset(
              "images/croup_4.png",
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return secondpage();
              }));
            },
            child: Container(
                child: Image.asset(
              "images/croup_5.png",
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
          ),
          InkWell(
            child: Container(
                child: Image.asset(
              "images/croup_6.png",
              height: 120,
              width: double.infinity,
              fit: BoxFit.fill,
            )),
          ),
        ],
      ),
    );
  }
}
