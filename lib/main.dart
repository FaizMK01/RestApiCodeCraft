import 'package:flutter/material.dart';
import 'Views/complexReqRes.dart';
import 'Views/complexWithOutModel.dart';
import 'Views/fakeStoreList.dart';
import 'Views/getPostWithModel.dart';
import 'Views/getPostWithOutModel.dart';
import 'Views/jobPost.dart';
import 'Views/multiPostCommentsWithModel.dart';
import 'Views/multiPostCommentsWithOutModel.dart';
import 'Views/postRegister.dart';
import 'Views/reqResSingleUser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobPost(),
    );
  }
}
