import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

class secondpage extends StatefulWidget {
  @override
  _secondpageState createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  List imagelist = [];
  List answerlist = [];
  List bottomlist = [];
  List toplist = [];
  Map mapppp = {};
  bool status = false;
  String imagepath = "";
  int i = 0;
  String spelling = "";
  FlutterTts flutterTts = FlutterTts();
  AudioPlayer audioPlayer = AudioPlayer();

  String audioasset = "audio/popup.wav";
  Uint8List? audiobytes;
  var c=Colors.yellow[700];
  int cnt=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initImages();
  }

  Future _initImages() async {
//  for audio player
    ByteData bytes = await rootBundle.load(audioasset);
    audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    //search to how to get list of images in flutter copy in code
    // >> To get paths you need these 2 lines
    final manifestContent = await rootBundle.loadString('AssetManifest.json');

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    // >> To get paths you need these 2 lines

    final allimage = manifestMap.keys
        .where((String key) => key.contains('images/'))
        .where((String key) => key.contains('.webp'))
        .toList();
    print(allimage);

    setState(() {
      imagelist = allimage;
    });

    print("........$imagelist");

    int randomimage = Random().nextInt(imagelist.length);
    print(randomimage);
    imagepath = imagelist[randomimage];
    print("ii $imagepath");

    // String imagepath = "images/balloon.webp";
    // List list1 = imagepath.split("/");
    // print(list1);
    // String s1 = list1[1];
    // print(s1);
    // List list2 = s1.split("\.");
    // String s2 = list2[0];
    // print(s2);

    spelling = imagepath.split("/")[1].split("\.")[0].toUpperCase();
    print(spelling); // balloon
    answerlist = spelling.split(""); // [b,a,l,lo]
    print("ans=$answerlist");
    toplist =
        List.filled(answerlist.length, ""); // [, , , , ,]jgya apva list filled
    print("top....$toplist");

    String abcd = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    List abcdlist = abcd.split(""); // [a,b,c,,..z]
    abcdlist.shuffle(); // [k,r,c...w]
    bottomlist =
        abcdlist.getRange(0, 10 - answerlist.length).toList(); // [d,r,h]
    print("b....$bottomlist");
    bottomlist.addAll(answerlist); // [d,r,h,b,a,l,l,o,o,n]
    bottomlist.shuffle(); // [r,a,h,n,o,l,o,l,b,d]

    print(bottomlist);

    setState(() {
      status = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: status
              ? ListView(children: [
            Column(
              children: [
                Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.amberAccent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          //  border: Border.all(color: Colors.white ),
                          color: Colors.white,
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.settings,
                            size: 30,
                          ),
                        ),
                      ),
                      Container(
                        width: 25,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: Colors.white,
                        ),
                        margin: EdgeInsets.all(10),
                        child: Text(
                          "1",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Container(
                              width: 30,
                              height: 40,
                              color: Colors.white,
                              child: Icon(Icons.attach_money),
                            ),
                            Container(
                              width: 40,
                              height: 40,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Text(
                                "100",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset("${imagepath}"),
                  ),
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.all(10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: toplist.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          //ans
                          await audioPlayer.playBytes(audiobytes!);
                          setState(() {
                            if (toplist[index] != "") {
                              bottomlist[mapppp[index]] = toplist[index];
                              toplist[index] = "";
                              c=Colors.yellow[700];

                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(3),
                          color: Colors.orangeAccent,
                          child: Text(
                            toplist[index],
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 100,

                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 12,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      if (index == 10) {
                        return InkWell(
                            onTap: () async {
                              await flutterTts.speak(spelling);
                            },
                            child: Container(
                              child: Center(
                                  child: Icon(
                                    Icons.lightbulb,
                                    color: Colors.amberAccent,
                                  )),
                            ));
                      } else if (index == 11) {
                        return InkWell(
                            onTap: () async {
                              // await flutterTts.speak(spelling);
                              for (int i = 0; i < answerlist.length; i++) {
                                await Future.delayed(Duration(seconds: 2));
                                await flutterTts.speak(answerlist[i]);
                              }
                            },
                            child: Container(
                              child: Center(
                                  child: Icon(
                                    Icons.lightbulb,
                                    color: Colors.red,
                                  )),
                            ));
                      } else {
                        return InkWell(
                          onTap: () async {
                            for (int i = 0; i < toplist.length; i++) {
                              if (toplist[i] == "") {
                                toplist[i] = bottomlist[index];
                                bottomlist[index] = "";
                                //    {where : from}
                                //     i  = index
                                mapppp[i] = index;
                                setState(() {});
                                print(mapppp);
                                await audioPlayer.playBytes(audiobytes!);
                                setState(() {});
                                break;
                              }
                            }
                            if(listEquals(toplist,answerlist))
                            {
                              showDialog(context: context, builder:(context){
                                return AlertDialog(
                                  actions: [
                                    Container(
                                      child: Image.asset("images/star.png"),
                                    ),
                                    Container(
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return secondpage();
                                                },
                                              ));
                                        },
                                        child: Center(
                                            child: Text(
                                              "Continue",
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontFamily: "bubblegum"),
                                            )),
                                      ),
                                    )

                                  ],
                                );
                              });
                            }else {
                              if(!toplist.contains("")){
                                c = Colors.red;
                              }
                            }
                          },

                          child: Container(
                            color: Colors.orangeAccent,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(3),
                            child: Text(
                              "${bottomlist[index]}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                InkWell(onTap:(){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                    return secondpage();
                  },));
                } ,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purpleAccent
                    ),

                    child: Center(child: Text("Skip",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 20),)),
                  ),
                )
              ],
            ),
          ],

              )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
