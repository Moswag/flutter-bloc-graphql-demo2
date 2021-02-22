import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_demo_bloc_grahpql/models/book.dart';
import 'book_repository.dart';
part 'book_event.dart';
part 'book_state.dart';


class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BookRepository repository;
  BooksBloc({this.repository});
  @override
  BooksState get initialState => BooksInitial();

  @override
  Stream<BooksState> mapEventToState(
      BooksEvent event,
      ) async* {

    if(event is BooksFetched)
    {
      yield BooksLoading();
      var books = await repository.fetchAllBooks();
      yield LoadBooks(books:books);
    }

  }
}
