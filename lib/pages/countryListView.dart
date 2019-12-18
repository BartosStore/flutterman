import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryListView extends StatelessWidget {
  final String query = '''
    query ReadCountries {
      countries {
        code
        name
        currency
        emoji
        phone
        continent {
          code
          name
        }
        languages {
          code
          name
        }
      }
    }
  ''';

  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(document: query),
      builder: (QueryResult result,
          {VoidCallback refetch, FetchMore fetchMore}) {
        if (result.loading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (result.data == null) {
          return Center(
            child: Text('Countries not found'),
          );
        }

        return _renderCountriesView(result);
      },
    );
  }

  ListView _renderCountriesView(QueryResult result) {
    final countryList = result.data['countries'];

    return ListView.separated(
      itemCount: countryList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(countryList[index]['name']),
          subtitle: Text('Currency: ${countryList[index]['currency']}\n' +
              'Phone: ${countryList[index]['phone']}\n'
                  'Continent: ${countryList[index]['continent']['name']}'),
          leading: Text('${countryList[index]['emoji']}'),
          onTap: () {
            final snackbar = SnackBar(
              content: Text('Selected Country: ${countryList[index]['name']}'),
            );

            Scaffold.of(context).showSnackBar(snackbar);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
