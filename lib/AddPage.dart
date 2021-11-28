import 'package:flutter/material.dart';
import 'providers/list_provider.dart';
import 'package:provider/provider.dart';

class AddPage extends StatelessWidget {
  final TextEditingController txt = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(child: TextField(
                onEditingComplete: () {},
                textInputAction: TextInputAction.done,
                controller: txt,
                autofocus: false,
                decoration: InputDecoration(
                  labelText: "Enter Task"
                ),
              ),
                width: size.width-100,
                height: 300,
                alignment: Alignment.bottomCenter,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10
                ),
                child: Container(
                  child: TextButton(onPressed: () => {context.read<listitems>().addtask(txt.text),
                  txt.clear()}, child: Text("ADD"), style: TextButton.styleFrom(
                  primary: Colors.white,
                )),
                width: size.width-100,
                height: 50,
                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(25),
    
                ),
                color: Colors.lightBlue,
                ),),
              ),
            ],
          ),
          
        ),
      ),
    );
  }
}