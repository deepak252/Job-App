import 'package:flutter/material.dart';
import 'package:job_app/model/job.dart';
import 'package:job_app/model/theme_model.dart';
import 'package:job_app/screens/selected_job_screen.dart';
import 'package:provider/provider.dart';

class JobCard extends StatelessWidget {
  final Job job;
  const JobCard({
    Key? key,
    required this.job,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('Tapped');
        Navigator.push(context, MaterialPageRoute(
          builder: (context)=>SelectedJobScreen(job:job)
        ));
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Stack(
          children: <Widget>[
            buildCard(context),
            buildCompanyLogo(),
          ],
        ),
      ),
    );
  }

  Widget buildCompanyLogo() {
    return Container(
      margin: EdgeInsets.only(top: 30.0),
      child: CircleAvatar(
        child: Text(
          job.companyName.substring(0, 1),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24.0
          ),
        ),
        backgroundColor: Colors.purple,
        radius: 24.0,
      ),
      alignment: FractionalOffset.centerLeft,
    );
  }

  Widget buildCard(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      margin: EdgeInsets.only(
        left: 26.0
      ),
      decoration: BoxDecoration(
        color: Provider.of<ThemeModel>(context).getCardColor(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
           BoxShadow(  
            color: Colors.black38,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),

      child: Container(
        margin: EdgeInsets.only(left: 50,top: 10.0,right: 10.0,bottom: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(job.title),
                  const SizedBox(height: 10.0,),
                  Text(
                    job.companyName,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 12.0
                    ),
                  ),
            
                ],
            
              ),
            )
          ],
        ),
      ),

    );
  }
}


