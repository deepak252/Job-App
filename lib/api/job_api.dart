import 'dart:convert';

import 'package:job_app/model/job.dart';
import 'package:http/http.dart' as http;

class JobApi{
  static dynamic _data;
  static Future<List<Job>> getJobs() async{
    final  _url=Uri.parse('https://remotive.io/api/remote-jobs');
    http.Response response=await http.get(_url);
    if(response.statusCode==200){
      _data=jsonDecode(response.body)["jobs"];
      // print(data);
      return _data.map<Job>((json) => Job.fromJson(json)).toList();
    }else {
      throw Exception();
    }
  }

  static Future<List<String>> getJobTitles() async{
      if(_data!=null){
          return _data.map<String>((json) {
          String jobTitle = json['title'];
          return jobTitle;
        }).toList();
      }else{
        throw Exception();
      }
  }

  static Future<List<Job>> getSearchedJobTitles(String query) async {
    if (_data != null) {
      return _data.map<Job>((json)=>Job.fromJson(json)).where(
        (Job job){
          String titleLower=job.title.toLowerCase();
          String searchLower=query.toLowerCase();
          return titleLower.contains(searchLower);
        }
      ).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<String>> getJobTypes() async {
    if (_data != null) {
      return _data.map<String>((json) {
        String jobType = json['type'];
        return jobType;
      }).toList();
    } else {
      throw Exception();
    }
  }
static Future<List<String>> getJobCategories() async {
    if (_data != null) {
      return _data.map<String>((json) {
        String jobCategory = json['category'];
        return jobCategory;
      }).toList();
    } else {
      throw Exception();
    }
  }

  static Future<List<Job>> getFilteredJobs(String query) async {
    if (_data != null) {
      return _data.map<Job>((json) => Job.fromJson(json)).where((Job job) {
        String jobTypeLower = job.jobType.toLowerCase();
        String jobCategoryLower = job.category.toLowerCase();
        String searchLower = query.toLowerCase();
        return jobTypeLower.contains(searchLower) || jobCategoryLower.contains(searchLower);
      }).toList();
    } else {
      throw Exception();
    }
  }

  // static Future<List<Job>> orderByDateTime() async {
  //   List<Job> sortedData=[];
  //   if (_data != null) {
  //     return _data.map<Job>((json) => Job.fromJson(json)).where((Job job) {
  //       return titleLower.contains(searchLower);
  //     }).toList();
  //   } else {
  //     throw Exception();
  //   }
  // }



}