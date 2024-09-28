import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';

class MultiPostCommentsWithOutModel extends StatefulWidget {
  const MultiPostCommentsWithOutModel({super.key});

  @override
  State<MultiPostCommentsWithOutModel> createState() => _MultiPostCommentsWithOutModelState();
}

class _MultiPostCommentsWithOutModelState extends State<MultiPostCommentsWithOutModel> {
  
  
  dynamic postList = [];
  
  getPost(){
    ApiServices().getMulti().then((onValue){
      setState(() {
        postList = onValue;

      });
    });
  }
  
  @override
  void initState() {
    
    getPost();
    super.initState();
  }
  
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: ListView.builder(
          itemCount: postList.length,
            itemBuilder: (context,index){
          return ListTile(
            title: Text(postList[index]["title"].toString()),
          );
        }),
      ),
    );
  }
}
