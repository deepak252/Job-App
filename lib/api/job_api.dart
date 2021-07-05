import 'dart:convert';

import 'package:job_app/model/job.dart';
import 'package:http/http.dart' as http;

class JobApi{
  static Future<List<Job>> getJobs() async{
    final  _url=Uri.parse('https://remotive.io/api/remote-jobs');
    http.Response response=await http.get(_url);
    final data=jsonDecode(response.body)["jobs"];
    // print(data);
    return data.map<Job>(Job.fromJson).toList();
  }
}