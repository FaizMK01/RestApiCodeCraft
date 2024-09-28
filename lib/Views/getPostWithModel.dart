import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';
import 'package:rest_api_code_craft/Models/singlePostWithModel.dart';

class GetPostWithModel extends StatefulWidget {
  const GetPostWithModel({super.key});

  @override
  State<GetPostWithModel> createState() => _GetPostWithModelState();
}

class _GetPostWithModelState extends State<GetPostWithModel> {

  SinglePostWithModel singlePostWithModel = SinglePostWithModel();


  getPostWithModel(){

    ApiServices().getSinglePostWithModel().then((value){
      setState(() {
        singlePostWithModel = value!;

      });
    });

  }

  @override
  void initState() {
    getPostWithModel();
    super.initState();
  }

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 40),
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text("ID: ${singlePostWithModel.id}"),
            SizedBox(height: 15),
            Text("Title: ${singlePostWithModel.title.toString()}"),
            SizedBox(height: 20),

            Text("Body: ${singlePostWithModel.body.toString()}"),

          ],
        ),
      )
    );
  }
}
