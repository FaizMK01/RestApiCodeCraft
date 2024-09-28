import 'dart:convert';
import 'package:rest_api_code_craft/Models/complexReqResWithModel.dart';
import 'package:rest_api_code_craft/Models/fakeStoreListWithModel.dart';
import 'package:rest_api_code_craft/Models/jobPostModel.dart';
import 'package:rest_api_code_craft/Models/multiPostCommentsWithModel.dart';
import 'package:rest_api_code_craft/Models/postModel.dart';
import 'package:rest_api_code_craft/Models/reqResSingleUserWithModel.dart';
import 'package:rest_api_code_craft/Models/singlePostWithModel.dart';
import 'package:http/http.dart' as http;

class ApiServices {

  //singlePostWithModel

  Future<SinglePostWithModel?> getSinglePostWithModel() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        SinglePostWithModel model = SinglePostWithModel.fromJson(data);
        return model;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

 // singlePostWithOutModel

  Future<dynamic> getSinglePostWithOutModel() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
      var data = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {

        return data;

      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

  //multiPostCommentsWithModel

  Future<List<ModelMultiComments>?> getMultiPostComments() async {
    try {
      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      final response = await http.get(url);

      // Print the response status and body for confirmation
      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        List<ModelMultiComments> data = List<ModelMultiComments>.from(
            jsonDecode(response.body).map((x) => ModelMultiComments.fromJson(x))
        );
        return data;
      }
    } catch (e) {
      print(e.toString());
    }

    return null;
  }

  //multiPostCommentsWithOutModel

  Future<dynamic> getMulti() async{
    try{


      var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");

      final response = await http.get(url);

      if(response.statusCode==200){

        final data = jsonDecode(response.body);
        return data;


      }



    }catch(e){
      print(e.toString());
    }
}

 //ComplexReqResWithModel

  Future<ComplexReqResModel?> getComplex() async{

    try{

      var url = Uri.parse("https://reqres.in/api/unknown");
      final response = await http.get(url);
      var  data = jsonDecode(response.body);

      if(response.statusCode==200){

        ComplexReqResModel model = ComplexReqResModel.fromJson(data);
        return model;

      }

    }catch(e){
      print(e.toString());
    }

    return null;

  }

  //ComplexReqResWithOutModel

  Future<dynamic> getComplexWithOut() async{

    try{

      var url = Uri.parse("https://reqres.in/api/unknown");
      final response = await http.get(url);

      if(response.statusCode==200){
        var  data = jsonDecode(response.body);
        return data;

      }

    }catch(e){
      print(e.toString());
    }

    return null;

  }


  //ReqResSingleUser

  Future<SingleUser?> singleUser() async{
    
    try{
      var url = Uri.parse("https://reqres.in/api/users/2");
      
      final response = await http.get(url);
      var data = jsonDecode(response.body);

      if(response.statusCode==200){

        SingleUser model = SingleUser.fromJson(data);
        return model;


      }
      
      
      
    }catch(e){
      print(e.toString());
    }
    
    
    
    return null;
  }

  //FakeStoreApiList

  Future<List<FakeStoreList>?> fakeStore() async {
    try {
      var url = Uri.parse("https://fakestoreapi.com/products?limit=5");
      final response = await http.get(url);

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        List<FakeStoreList> data1 = List<FakeStoreList>.from(
            jsonDecode(response.body).map((x) => FakeStoreList.fromJson(x))
        );
        return data1;
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    }

    return null;
  }
  
  //postModel

 Future<PostModel?> postWithModel(String email,String password) async{
    
    try{
      
      var url = Uri.parse("https://reqres.in/api/register");
      final response = await http.post(url,body: {
        "email": email,
        "password": password
      });

      var data = jsonDecode(response.body);

      if(response.statusCode==200){

        PostModel model = PostModel.fromJson(data);
        return model;




      }
      
      
      
      
    }catch(e){
      print(e.toString());
    }
    
    
    
    return null;
 }

 //jobPostModel

 Future<JobPostModel?> createJob(String name,String job) async{
    try{

      var url = Uri.parse("https://reqres.in/api/users");
      final response = await http.post(url,body: {
        "name": name,
        "job": job
      });

      var data = jsonDecode(response.body);

      if(response.statusCode==201){

        JobPostModel model = JobPostModel.fromJson(data);
        return model;

      }










    }catch(e){
      print(e.toString());
    }




    return null;
 }







}
