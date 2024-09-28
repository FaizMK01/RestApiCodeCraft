import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';

import '../Models/reqResSingleUserWithModel.dart';

class ReqResSingleUser extends StatefulWidget {
  const ReqResSingleUser({super.key});

  @override
  State<ReqResSingleUser> createState() => _ReqResSingleUserState();
}

class _ReqResSingleUserState extends State<ReqResSingleUser> {


  SingleUser reqResSingleUser = SingleUser();

  getData(){


    ApiServices().singleUser().then((value){
      setState(() {
        reqResSingleUser = value!;
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
      body: Center(
        child: reqResSingleUser==null?CircularProgressIndicator():ListTile(
          leading: Image.network(reqResSingleUser.data!.avatar.toString()),
          title: Text(reqResSingleUser.data!.email.toString(),


        ),
        ),
      )

    );
  }
}
