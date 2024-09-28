import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';

class GetPostWithOutModel extends StatefulWidget {
  const GetPostWithOutModel({super.key});

  @override
  State<GetPostWithOutModel> createState() => _GetPostWithOutModelState();
}

class _GetPostWithOutModelState extends State<GetPostWithOutModel> {
  
  
  dynamic singlePost;
  
  
  getPostWithOutModel(){
    ApiServices().getSinglePostWithOutModel().then((value){

      setState(() {
        singlePost = value;


      });
      

      
    });
  }
  
  
  @override
  void initState() {
    getPostWithOutModel();
    super.initState();
  }
  
  
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(singlePost["title"].toString())
          
        ],
      ),
    );
  }
}
