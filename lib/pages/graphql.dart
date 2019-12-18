import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutterman/pages/countryListView.dart';

class Graphql extends StatefulWidget {
  @override
  GraphqlState createState() => GraphqlState();
}

class GraphqlState extends State<Graphql> {
  final HttpLink httpLink =
      HttpLink(uri: 'https://countries.trevorblades.com/');

  ValueNotifier<GraphQLClient> client;

  @override
  void initState() {
    super.initState();
    AuthLink authLink = AuthLink(
      getToken: () => 'Bearer NDc4NDkyNDg3ODE3OstHYSeYC1UgXqRacSqvUbookcZk',
    );

    Link link = authLink.concat(httpLink);

    client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List of countries via GraphQl'),
        ),
        body: GraphQLProvider(
          child: CountryListView(),
          client: client,
        )
        );
  }
}
