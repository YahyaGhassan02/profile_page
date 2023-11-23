import 'package:flutter/material.dart';
import 'package:profile_page/layout/date.dart';

class SquareHis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "History",
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: DateDisplay(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
