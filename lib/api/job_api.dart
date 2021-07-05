import 'dart:convert';

import 'package:job_app/model/job.dart';
import 'package:http/http.dart' as http;

class JobApi{
  static dynamic _data;
  static Future<List<Job>> getJobs() async{
    final  _url=Uri.parse('https://remotive.io/api/remote-jobs');
    http.Response response=await http.get(_url);
    _data=jsonDecode(response.body)["jobs"];
    // print(data);
    return _data.map<Job>(Job.fromJson).toList();
  }

  static Future<List<String>> getJobTitles() async{
    return _data.map<String>((json){
      String jobTitle=json['title'];
      return jobTitle;
    }).toList();
  }
}