part of 'book_bloc.dart';

@immutable
abstract class BooksState {}

class BooksInitial extends BooksState {}


class BooksLoading extends BooksState {}
// ignore: must_be_immutable
class LoadBooks extends BooksState{
  List<Book> books;
  LoadBooks({this.books});
}