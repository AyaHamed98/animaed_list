
import 'package:flutter/material.dart';

import 'custom_animated_list.dart';

class AnimatedListView extends StatelessWidget {
  const AnimatedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Animated List"),
        centerTitle: true,
      ),
      body: CustomAnimatedList(),
    );
  }
}
