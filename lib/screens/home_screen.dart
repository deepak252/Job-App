import 'package:flutter/material.dart';
import 'package:job_app/api/job_api.dart';
import 'package:job_app/model/job.dart';
import 'package:job_app/widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: FutureBuilder<List<Job>>(
        future: JobApi.getJobs(),
        builder: (context,snapshot){
          final jobList=snapshot.data;
          switch(snapshot.connectionState){
            case ConnectionState.waiting : 
              return Center(child: CircularProgressIndicator(),);
            default: 
              if(snapshot.hasError)
                return Center(child: Text('Error for getting jobs data'));
              else{
                return BuildJobCards(jobs:jobList!);
              }
          }
        },
      ),
    );
  }
}


class BuildJobCards extends StatelessWidget {
  final List<Job> jobs;

  BuildJobCards({required this.jobs});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context,index){
        final job=jobs[index];
        return JobCard(job: job);
      },
    );
  }
}


