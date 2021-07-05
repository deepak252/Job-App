import 'package:flutter/material.dart';
import 'package:job_app/api/job_api.dart';
import 'package:job_app/model/job.dart';
import 'package:job_app/widgets/job_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
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


class BuildJobCards extends StatefulWidget {
  final List<Job> jobs;

  BuildJobCards({required this.jobs});

  @override
  _BuildJobCardsState createState() => _BuildJobCardsState();
}

class _BuildJobCardsState extends State<BuildJobCards> {
  ScrollController _scrollController=ScrollController();
  int _currentLength=10;
  
  @override
  void initState(){
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        _getMoreData();
      }
    });
  }

  _getMoreData(){
    for(int i=_currentLength;i<_currentLength+10;i++)
    {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.jobs.length,
      itemBuilder: (context,index){
        final job=widget.jobs[index];
        return JobCard(job: job);
      },
    );
  }
}


