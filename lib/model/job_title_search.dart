import 'package:flutter/material.dart';
import 'package:job_app/api/job_api.dart';

class JobTitleSearch extends SearchDelegate<String>{

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: (){
        close(context, '');
      },
      
    );
  }

  @override
  List<Widget> buildActions(BuildContext context){
    return [IconButton(
      icon: Icon(Icons.clear),
      onPressed: (){
        if (query.isEmpty) {
            close(context, '');
          } else {
            query = '';
            showSuggestions(context);
          }
      }, 
    )];
  }

  @override
  Widget buildResults(BuildContext context){
    // return SelectedJobScreen(job: job);
    return Center(child: Text('selected job screen'));
  }

  @override
  Widget buildSuggestions(BuildContext context){
    return FutureBuilder<List<String>>(
      future: JobApi.getJobTitles(),
      builder: (context,snapshot){
        final data=snapshot.data ?? [];
        if(query.isEmpty) 
          return buildNoSuggestions();
        switch(snapshot.connectionState){
          case ConnectionState.waiting : 
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            if(data.isEmpty  ||  snapshot.hasError)
              return buildNoSuggestions();
            else{
              final suggestions = query.isEmpty
                      ? ['']
                      : data.where((jobTitle) {
                          final cityLower = jobTitle.toLowerCase();
                          final queryLower = query.toLowerCase();

                          return cityLower.startsWith(queryLower);
                        }).toList();
                  return buildSuggestionsSuccess(suggestions);

            }
        }
      }
    );
  }

  // final suggestions = query.isEmpty
  //       ? recentCities
  //       : cities.where((city) {
  //           final cityLower = city.toLowerCase();
  //           final queryLower = query.toLowerCase();

  //           return cityLower.startsWith(queryLower);
  //         }).toList();

  //   return buildSuggestionsSuccess(suggestions);


  Widget buildNoSuggestions() => Center(
    child: Text(
      'No suggestions!',
      style: TextStyle(fontSize: 24),
    ),
  );

  Widget buildSuggestionsSuccess(List<String> suggestions){
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context,index){
        final suggestion=suggestions[index];
        final queryText = suggestion.substring(0, query.length);
        final remainingText = suggestion.substring(query.length);

        return ListTile(
            onTap: () {
              query = suggestion;

              // 1. Show Results
              showResults(context);
              // 2. Close Search & Return Result
              // close(context, suggestion);

              // 3. Navigate to Result Page
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ResultPage(suggestion),
              //   ),
              // );
            },
            leading: Icon(Icons.location_city),
            // title: Text(suggestion),
            title: RichText(
              text: TextSpan(
                text: queryText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: remainingText,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
      }
    );
  }





}