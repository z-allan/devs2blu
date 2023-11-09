import "package:biblioteca/screens/edit_book.dart";
import "package:flutter/material.dart";

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      height: 100,
      child: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditBook(),));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
