import 'package:flutter/material.dart';
import 'package:job_app/api/job_api.dart';
import 'package:job_app/model/filter_search.dart';
import 'package:job_app/model/job.dart';
import 'package:job_app/model/theme_model.dart';
import 'package:job_app/widgets/job_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Job> ?  jobList;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Provider.of<ThemeModel>(context).getCardColor(),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () async{
                    final results = await showSearch(
                      context: context, delegate: FilterSearch(),
                    );
                  },
                  child: Row(
                    children: [Icon(Icons.filter_alt_outlined), Text('Filter')],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      minimumSize: Size(30,25)
                  ),

                ),
                ElevatedButton(
                  onPressed: () {
                    SortJobCards(
                      jobs: jobList!,            
                    );
                  },
                  child: Row(
                    children: [Icon(Icons.sort), Text('Date')],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      minimumSize: Size(30, 25)

                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: FutureBuilder<List<Job>>(
                future: JobApi.getJobs(),
                builder: (context, snapshot) {
                  jobList = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    default:
                      if (snapshot.hasError)
                        return Center(child: Text('Error for getting jobs data'));
                      else {
                        return BuildJobCards(jobs: jobList!);
                      }
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


// void buildModalBottomSheet(BuildContext context) {
//     showModalBottomSheet(
//         context: context,
//         builder: (builder) {
//           return new Container(
//             height: 350.0,
//             color: Colors.transparent, //could change this to Color(0xFF737373),
//             //so you don't have to change MaterialApp canvasColor
//             child: new Container(
//                 decoration: new BoxDecoration(
//                     color: Provider.of<ThemeModel>(context).getCardColor(),
//                     borderRadius: new BorderRadius.only(
//                         topLeft: const Radius.circular(10.0),
//                         topRight: const Radius.circular(10.0))),
//                 child:  Container(
//                   child: new Text("This is a modal sheet"),
//                 )),
//           );
//         });
//   }
}

class BuildJobCards extends StatelessWidget {
  final List<Job> jobs;

  BuildJobCards({required this.jobs});

  @override
  Widget build(BuildContext context) {
    // jobs.sort((a,b)=>a.compareTo(b))
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return JobCard(job: job);
      },
    );
  }
}


class SortJobCards extends StatelessWidget {
  final List<Job> jobs;

  SortJobCards({required this.jobs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return JobCard(job: job);
      },
    );
  }
}

