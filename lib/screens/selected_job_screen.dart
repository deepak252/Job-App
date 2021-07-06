import 'package:flutter/material.dart';
import 'package:job_app/model/date_time_model.dart';
import 'package:job_app/model/job.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:job_app/model/theme_model.dart';
import 'package:job_app/widgets/rich_text_widget.dart';
import 'package:provider/provider.dart';

class SelectedJobScreen extends StatelessWidget {
  final Job job;
  const SelectedJobScreen({ Key? key, required this.job }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Provider.of<ThemeModel>(context).getCardColor(),
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                          
                  child: ListView(
                    children: <Widget>[
                      const SizedBox(height: 12,),

                      Text(
                        job.title,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 12,),
                      RichTextWidget(
                        label: 'Company Name: ',
                        value: job.companyName,
                      ),
                      RichTextWidget(
                        label: 'Location: ',
                        value: job.candidateRequiredLocation,
                      ),
                      RichTextWidget(
                        label: 'Publication Date: ',
                        value: DateTimeModel.getOnlyDate(job.publicationDate),
                      ),
                      RichTextWidget(
                        label: 'Category: ',
                        value: job.category,
                      ),
                      
                      Text(job.salary),
                      SingleChildScrollView(
                        child: Html(
                          data: job.description,
                          style:{

                          } ,
                        ),
                      )
                      
                    ],
                  ),
                ),
              ),

              // TextButton.icon(
              //   icon: Icon(Icons.link),
              //   label:Text('Apply now'),
              //   onPressed: (){},
              // )
              ElevatedButton(
                onPressed: (){}, 
                child: Text('Apply now'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  minimumSize: Size(double.infinity, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  )
                ),
              
              ),
            ],
          ),
        ),
      ),
            
    );
  }
}

