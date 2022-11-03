
import 'package:flutter/material.dart';

import 'animated_item.dart';

class CustomAnimatedList extends StatefulWidget {
  const CustomAnimatedList({Key? key}) : super(key: key);

  @override
  State<CustomAnimatedList> createState() => _CustomAnimatedListState();
}

class _CustomAnimatedListState extends State<CustomAnimatedList> {
  final List<String> items = [];
  final GlobalKey<AnimatedListState> key = GlobalKey();
  final ScrollController controller=ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: AnimatedList(
              controller: controller,
              key: key,
              initialItemCount: items.length,
              itemBuilder: (context, index, animation) => SlideTransition(

                position: animation.drive(
                    Tween(
                      begin:Offset(1, 1) ,
                      end:Offset(0, 0),
                    )
                ),
                child: AnimatedItem(
                  txt: "${items[index]}",
                  onPress: (){
                    deleteItem(index);
                  },
                ),
              )),
        ),
        TextButton(
            onPressed: () {
              insertItem();
            },
            child:const Text(
              "Add Item ",
              style: TextStyle(fontSize: 24,color: Colors.purple),

            ))
      ],
    );
  }



  void insertItem(){
    var index=items.length;
    items.add("item ${index+1}");
    key.currentState!.insertItem(index);
    Future.delayed(Duration(milliseconds: 300),(){
      controller.animateTo(
          controller.position.maxScrollExtent,
          duration: Duration(milliseconds: 300), curve: Curves.easeInOut
      );
    });
  }
  void deleteItem(int index){
    String txt=items.removeAt(index);
    key.currentState!.removeItem(index, (context, animation) => SizeTransition(
        sizeFactor: animation,
        child: AnimatedItem(txt: txt, onPress: (){})));
  }
}
