import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';
import 'package:rest_api_code_craft/Models/jobPostModel.dart';
import 'package:rest_api_code_craft/Views/jobDetails.dart';

class JobPost extends StatefulWidget {
  const JobPost({super.key});

  @override
  State<JobPost> createState() => _JobPostState();
}

class _JobPostState extends State<JobPost> {

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  JobPostModel jobPostModel = JobPostModel();

  showData(){
    ApiServices().createJob(nameController.text, jobController.text).then((value){


      setState(() {
        jobPostModel = value!;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>JobDetails(name: jobPostModel.name.toString(), job: jobPostModel.job.toString(), id: jobPostModel.id.toString(), createdAt: jobPostModel.createdAt.toString())
        ),
        );
      });
    });
  }






  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Your Name"
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: jobController,
              decoration: InputDecoration(
                  hintText: "Enter Your Job"
              ),
            ),
            SizedBox(height: 30),
            
            ElevatedButton(onPressed: (){
              showData();


            }, child: Text("Next Page To View Details"))
            
          ],
        ),
      ),
    );
  }
}
