import 'package:flutter_demo_bloc_grahpql/bloc/card/bank_card_queries.dart';
import 'package:flutter_demo_bloc_grahpql/models/bank_card.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_demo_bloc_grahpql/GraphQL/Connection.dart';


class BankCardRepository{
  GraphQLClient _client = clientToQuery();

  Future<List<BankCard>> fetchAllBankCards() async{
    QueryResult result = await _client.query(
        QueryOptions(
            documentNode: gql(getAllBankCardsQuery)
        )
    );

    if(!result.hasException)
    {
      List data = result.data["accountListing"];
      List<BankCard> books =[];
      data.forEach((e){
        books.add(
            BankCard(
                availableBalance: e["availableBalance"],
                accountNumber:  e["accountNumber"],
              currency: e["currency"],
              ledgerBalance: e["ledgerBalance"],
              accountName: e["accountName"],
              bankAccountType: e["bankAccountType"],
            )
        );
      });
      return books;
    }
  }

}
