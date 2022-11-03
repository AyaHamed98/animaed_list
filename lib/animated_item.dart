
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedItem extends StatelessWidget {
  const AnimatedItem({Key? key, required this.txt,required this.onPress}) : super(key: key);
  final String txt;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading:const CircleAvatar(
          backgroundColor: Colors.purple,
        ),
        title: Text(txt),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed:onPress,
        ),
      ),
    );
  }

}