import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/time_provider.dart';
import 'providers/list_provider.dart';
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
    final orien = MediaQuery.of(context).orientation;
    final height = size.height - 80;
    String time = context.watch<Time>().timeout;
    double x = 90;
    double y = 15;

    if (orien == Orientation.landscape) {
      x = 40;
      y = 0;
    } else {
      x = 90;
      y = 15;
    }


    return Scaffold(
      appBar: AppBar(
        title: Text('TODO APP', style: TextStyle(fontWeight: FontWeight.w500,),),
        elevation: 0,
        backgroundColor: Colors.lightGreen,
        leading: Icon(Icons.menu),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "a",
            onPressed: () => context.read<listitems>().reset(),
            child: Icon(Icons.clear)
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () => {Navigator.pushNamed(context, '/add')},
            child: Icon(Icons.add)
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        height: height,
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
                      height: height,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      width: size.width,
                      height: (height * 0.4),
                      color: Colors.lightGreen,
                      child: Padding(padding:EdgeInsets.fromLTRB(0, y, 0, 0) ,child: Text("$time", style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: x),)),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: ItemList(),
                        width: size.width,
                        height: (height * 0.70) + 50,
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