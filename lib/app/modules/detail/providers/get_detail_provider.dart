import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphql_strings.dart';

Future<List> getDetail({id}) async {
  HttpLink link = HttpLink(
      "https://rickandmortyapi.com/graphql"); // this is api call for getting all users
  GraphQLClient qlClient = GraphQLClient(
    // same client create
    link: link,
    cache: GraphQLCache(
      store: HiveStore(),
    ),
  );
  QueryResult queryResult = await qlClient.query(
    // here it's get type so using query method
    QueryOptions(
      fetchPolicy: FetchPolicy.networkOnly,
      document: gql(
        """query {
  charactersByIds(ids:$id){
    name,
    id,
    status,
    image
  }
}""", // let's see query string
      ),
    ),
  );
  // print(queryResult.data?['characters']['results']);

  return queryResult.data?['charactersByIds'] ??
      []; // here i am getting list in getUsers field which i am return
}
