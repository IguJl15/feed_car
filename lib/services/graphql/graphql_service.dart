import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  late GraphQLClient client;
  

  GraphQLService({required HttpLink link}) {
    client = GraphQLClient(link: link, cache: GraphQLCache());
  }

  Future<QueryResult> executeQuery(
    String query,
  ) async {
    
    final options = QueryOptions(document: gql(query));
    final result = await client.query(options);

    return result;
  }

  Future<QueryResult> executeMutation(String query,
      ) async {
    MutationOptions options = MutationOptions(document: gql(query));

    final result = await client.mutate(options);

    if (kDebugMode) {
      print(result);
    }

    return result;
  }
}
