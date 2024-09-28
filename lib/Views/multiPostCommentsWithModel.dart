import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';

import '../Models/multiPostCommentsWithModel.dart';

class MultiPostCommentsWithModel extends StatefulWidget {
  const MultiPostCommentsWithModel({super.key});

  @override
  State<MultiPostCommentsWithModel> createState() => _MultiPostCommentsWithModelState();
}

class _MultiPostCommentsWithModelState extends State<MultiPostCommentsWithModel> {



  List<ModelMultiComments> multiPostCommentsWithModel = [];


  getMultiPost(){
    ApiServices().getMultiPostComments().then((value){

      setState(() {
        multiPostCommentsWithModel = value!;
      });


    });
  }


  @override
  void initState() {
    getMultiPost();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(child: ListView.builder(
        itemCount: multiPostCommentsWithModel.length,
          itemBuilder: (context,index){
          return Card(
            child: ListTile(
              leading: Text(multiPostCommentsWithModel[index].id.toString()),
              title: Text(multiPostCommentsWithModel[index].title.toString()),
              subtitle: Text(multiPostCommentsWithModel[index].body.toString()),
            ),
          );
        
      }),
      ),
    );
  }
}
