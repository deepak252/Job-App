import 'package:flutter/material.dart';
import 'package:job_app/api/job_api.dart';
import 'package:job_app/screens/home_screen.dart';

import 'job.dart';

class FilterSearch extends SearchDelegate<String> {
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          if (query.isEmpty) {
            close(context, '');
          } else {
            query = '';
            showSuggestions(context);
          }
        },
      )
    ];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: FutureBuilder<List<Job>>(
        future: JobApi.getFilteredJobs(query),
        builder: (context, snapshot) {
          final jobList = snapshot.data;
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text('Error for getting jobs data'));
              } else {
                return BuildJobCards(jobs: jobList!);
              }
          }
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: JobApi.getJobCategories(),
        builder: (context, snapshot) {
          final data = snapshot.data ?? [];
          if (query.isEmpty) return buildNoSuggestions();
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (data.isEmpty || snapshot.hasError)
                return buildNoSuggestions();
              else {
                var suggestions = query.isEmpty
                    ? ['']
                    : data.where((jobTitle) {
                        final categoryLower = jobTitle.toLowerCase();
                        final typeLower = jobTitle.toLowerCase();
                        final queryLower = query.toLowerCase();

                        return typeLower.startsWith(queryLower);
                      }).toList();
                suggestions = suggestions.toSet().toList();
                return buildSuggestionsSuccess(suggestions);
              }
          }
        });
  }

  Widget buildNoSuggestions() => Center(
        child: Text(
          'No suggestions!',
          style: TextStyle(fontSize: 24),
        ),
      );

      // final suggestions = query.isEmpty
      //   ? recentCities
      //   : cities.where((city) {
      //       final cityLower = city.toLowerCase();
      //       final queryLower = query.toLowerCase();

      //       return cityLower.startsWith(queryLower);
      //     }).toList();

    // return buildSuggestionsSuccess(suggestions);

  Widget buildSuggestionsSuccess(List<String> suggestions) {
    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];

          return ListTile(
            onTap: () {
              query = suggestion;
              showResults(context);
            },
            leading: Icon(Icons.location_city),
            title: Text(suggestion),
          );
        });
  }
}
