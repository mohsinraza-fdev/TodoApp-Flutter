import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/time_provider.dart';
import 'ItemList.dart';
import 'dart:async';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key key }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
    context.read<Time>().time();
   });
    final size = MediaQuery.of(context).size;
    var date = DateTime.now();
    String middle = ":";
    String time = context.watch<Time>().timeout;


    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => {},
            child: Icon(Icons.clear)
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => {},
            child: Icon(Icons.add)
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: size.height,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ 
            Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: <Widget>[
              Stack(
                
                children: [
                    Container(
                      width: size.width,
                      height: size.height,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: size.width,
                      height: size.height * 0.4,
                      color: Colors.lightGreen,
                      child: Padding(padding:EdgeInsets.fromLTRB(0, 45, 0, 0) ,child: Text("$time", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 90),)),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: ItemList(),
                        width: size.width,
                        height: (size.height * 0.70) + 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)
                          ),
                        ),

                      )
                    ),
                ],
                
              )
            ],
          ),
          ]
        ),
      )
    );
  }
}