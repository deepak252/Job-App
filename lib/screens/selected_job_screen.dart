import 'package:flutter/material.dart';
import 'package:job_app/model/job.dart';

class SelectedJobScreen extends StatelessWidget {
  final Job job;
  const SelectedJobScreen({ Key? key, required this.job }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Text('Job Details'),
        ),
      ),
            
    );
  }
}