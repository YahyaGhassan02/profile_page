import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: ListView(
            children: [
              ListTile(title: Text('Review 1')),
              ListTile(title: Text('Review 2')),
              ListTile(title: Text('Review 3')),
            ],
          ))
        ],
      )
    );
  }
}
