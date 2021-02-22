import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/book/book_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/card/bank_card_bloc.dart';
import 'package:flutter_demo_bloc_grahpql/screens/books_screen.dart';

import 'bloc/book/book_repository.dart';
import 'bloc/card/bank_card_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  BookRepository bookRepository = new BookRepository();
  BankCardRepository bankCardRepository = new BankCardRepository();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BooksBloc>(
          create: (context) =>
          BooksBloc(repository: bookRepository)
            ..add(BooksFetched()),
        ),
        BlocProvider<BankCardBloc>(
          create: (context) =>
          BankCardBloc(repository: bankCardRepository)
            ..add(BankCardFetched()),
        ),
      ],
      child:
      MaterialApp(
          title: 'ZB Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home:BooksScreen()

      ),
    );
  }
}


