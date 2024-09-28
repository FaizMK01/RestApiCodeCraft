import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';

class ComplexWithOutModel extends StatefulWidget {
  const ComplexWithOutModel({super.key});

  @override
  State<ComplexWithOutModel> createState() => _ComplexWithOutModelState();
}

class _ComplexWithOutModelState extends State<ComplexWithOutModel> {
  
  
  dynamic complex;
  
  getData(){
    ApiServices().getComplexWithOut().then((value){
      
      
      setState(() {
        complex = value;
      });
      
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
          child: ListView.builder(
            itemCount: complex["data"].length,
              itemBuilder: (context,index){
              return ListTile(
                title: Text(complex["data"][index]["name"].toString()),
              );
              }),
      )
    );
  }
}
