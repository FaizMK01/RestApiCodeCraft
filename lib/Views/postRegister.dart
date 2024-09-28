import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';
import 'package:rest_api_code_craft/Models/postModel.dart';

class PostRegister extends StatefulWidget {
  const PostRegister({super.key});

  @override
  State<PostRegister> createState() => _PostRegisterState();
}

class _PostRegisterState extends State<PostRegister> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordControllerr = TextEditingController();

  PostModel postModel = PostModel();

  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: postModel==null?Text(""):Text(postModel.token.toString()),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: "Enter Your Email"
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordControllerr,
              decoration: InputDecoration(
                  hintText: "Enter Your Password"
              ),
            ),
            SizedBox(
              height: 30,
            ),
            
            ElevatedButton(onPressed: (){
              
              ApiServices().postWithModel(emailController.text, passwordControllerr.text).then((value){
                
                
                setState(() {
                  postModel = value!;
                });
                
              });
              
              
            }, child: Text("Login"))
            
          ],
        ),
      ),
    );
  }
}
