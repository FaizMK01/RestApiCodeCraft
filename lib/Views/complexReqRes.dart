import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';
import 'package:rest_api_code_craft/Models/complexReqResWithModel.dart';

class ComplexReqRes extends StatefulWidget {
  const ComplexReqRes({super.key});

  @override
  State<ComplexReqRes> createState() => _ComplexReqResState();
}

class _ComplexReqResState extends State<ComplexReqRes> {
  
  
  ComplexReqResModel complexReqResModel = ComplexReqResModel();
  
  
  getData() {
    ApiServices().getComplex().then((value){
      setState(() {
        
        complexReqResModel = value!;
        
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
      body: Container(
        child: Expanded(
          child: ListView.builder(
            itemCount: complexReqResModel.data!.length,
            itemBuilder: (context,index){
              return Card(
                child: ListTile(
                  leading: Text(complexReqResModel.data![index].id.toString()),
                  title: Text(complexReqResModel.data![index].name.toString()),
                  subtitle: Text(complexReqResModel.data![index].year.toString()),


                ),
              );
            }),
        )
      ),
    );
  }
}
