import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc_grahpql/screens/books_screen.dart';

class BlankScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext con) => BooksScreen())),
          ),
        ),
      ),
    );
  }
}
