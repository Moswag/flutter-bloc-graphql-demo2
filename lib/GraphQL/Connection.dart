import 'package:graphql_flutter/graphql_flutter.dart';
final HttpLink httpLink = HttpLink(
  uri: "http://41.78.78.238:4000/apollo-ewallet-api/",
);

GraphQLClient clientToQuery() {
  return GraphQLClient(
    // cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    cache: InMemoryCache(),
    link: httpLink,
  );
}