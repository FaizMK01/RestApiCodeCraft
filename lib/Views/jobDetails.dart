import 'package:flutter/material.dart';

class JobDetails extends StatefulWidget {

   String name;
   String job;
   String id;
   String createdAt;




    JobDetails({super.key,required this.name,required this.job,required this.id,required this.createdAt});

  @override
  State<JobDetails> createState() => _JobDetailsState();
}

class _JobDetailsState extends State<JobDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Name: ${widget.name}"),
          Text("Job: ${widget.job}"),
          Text("ID: ${widget.id}"),
          Text("Created At: ${widget.createdAt}"),

        ],
      ),
    );
  }
}
