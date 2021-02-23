import 'package:flutter_demo_bloc_grahpql/models/atm_location.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_demo_bloc_grahpql/GraphQL/Connection.dart';

import 'atm_location_queries.dart';


class AtmLocationRepository{
  GraphQLClient _client = clientToQuery();

  Future<List<AtmLocation>> fetchAllATMLocationsByCity() async{
    QueryResult result = await _client.mutate(
        MutationOptions(
            documentNode: gql(searchAtmsByCity()),
          fetchPolicy: FetchPolicy.noCache,
          variables:{
            "city": {
              "city": "Harare"
            }
          }

        ),

    );

    if(!result.hasException)
    {
      List data = result.data["action"];
      List<AtmLocation> atmLocations =[];
      data.forEach((e){
        atmLocations.add(
            AtmLocation(
                id: e["id"],
                name: e["name"],
              city: e["city"],
              email: e["email"],
              fax: e["fax"],
              latitude: e["latitude"],
              longitude: e["longitude"],
              postalAddress: e["postalAddress"],
              telephone: e["telephone"],

            )
        );
      });
      return atmLocations;
    }
  }

}
