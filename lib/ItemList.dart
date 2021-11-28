import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/list_provider.dart';

class ItemList extends StatelessWidget {
  const ItemList({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List items = context.watch<listitems>().tasklist;
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index){
          return Padding(
            child: Dismissible(
              key: Key(items[index]),
              onDismissed: (direction) {
                context.read<listitems>().remove(index);
              },
              child: ListTile(
                title: Text(items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.circle),
                  onPressed: () => {},
                ),
                ),
            ),
            padding: EdgeInsets.fromLTRB(20, 0, 5, 0)
            );
        },
        
      );
  }
}