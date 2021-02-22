import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/book/book_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/screens/bank_card_screen.dart';

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jobs"),
        leading: IconButton(
          icon: Icon(Icons.add),
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext con) => BankCardScreen())),
        ),
      ),
      body: BlocBuilder<BooksBloc, BooksState>(
        builder: (context, state) {
          if (state is BooksLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is LoadBooks) {
            print(state.books.toString());
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      state.books[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(state.books[index].author ?? ""),
                  );
                });
          }
        },
      ),
    );
  }
}
