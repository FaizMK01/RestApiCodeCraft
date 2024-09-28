import 'package:flutter/material.dart';
import 'package:rest_api_code_craft/Api_Services/apiServices.dart';
import 'package:rest_api_code_craft/Models/fakeStoreListWithModel.dart';

class FakeStore extends StatefulWidget {
  const FakeStore({super.key});

  @override
  State<FakeStore> createState() => _FakeStoreState();
}

class _FakeStoreState extends State<FakeStore> {

  List<FakeStoreList> fakeStoreList = [];


  getDataFake() {
    ApiServices().fakeStore().then((value) {
      if (value != null && value.isNotEmpty) {
        setState(() {
          fakeStoreList = value;
        });
      } else {
        print('No data fetched or data is empty');
      }
    });
  }


  @override
  void initState() {
    getDataFake();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: fakeStoreList.isEmpty
          ? const Center(child: CircularProgressIndicator())  // Show loader while fetching data
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fakeStoreList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                   // leading: Image.network(fakeStoreList[index].image.toString()),
                    title: Text(fakeStoreList[index].title.toString()),
                  //  subtitle: Text(fakeStoreList[index].description.toString()),
                    //trailing: Text(fakeStoreList[index].rating!.count.toString()),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

}
