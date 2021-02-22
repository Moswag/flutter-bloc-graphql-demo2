import 'package:flutter_demo_bloc_grahpql/bloc/book/book_queries.dart';
import 'package:flutter_demo_bloc_grahpql/models/book.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_demo_bloc_grahpql/GraphQL/Connection.dart';


class BookRepository{
  GraphQLClient _client = clientToQuery();

  Future<List<Book>> fetchAllBooks() async{
    QueryResult result = await _client.query(
        QueryOptions(
            documentNode: gql(getAllBooksQuery)
        )
    );

    if(!result.hasException)
    {
      List data = result.data["books"];
      List<Book> books =[];
      data.forEach((e){
        books.add(
            Book(
                author: e["author"],
                title: e["title"]
            )
        );
      });
      return books;
    }
  }

}
