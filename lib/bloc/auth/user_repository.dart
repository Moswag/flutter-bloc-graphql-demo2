

import 'package:flutter_demo_bloc_grahpql/GraphQL/Connection.dart';
import 'package:flutter_demo_bloc_grahpql/bloc/atm/atm_location_queries.dart';
import 'package:flutter_demo_bloc_grahpql/models/auth_request.dart';
import 'package:flutter_demo_bloc_grahpql/models/auth_response.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class AuthRepository {
  GraphQLClient _client = clientToQuery();

  Future<bool> authenticatedUser(AuthRequest authRequest) async {

    QueryResult result = await _client.mutate(
      MutationOptions(
          documentNode: gql(authenticateUserQuery()),
          fetchPolicy: FetchPolicy.noCache,
         variables:{
      "auth": authRequest.toJson()
         }
      ),

    );

    if(!result.hasException)
    {
      AuthResponse authResponse=AuthResponse.fromJson(result.data["login"]);
      print(authResponse.toJson().toString());
      return authResponse.loginResponse=="000"?true:false;
    }
    else{
      return false;
    }
  }

}