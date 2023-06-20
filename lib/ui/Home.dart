import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_tml/model/TestModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<TestModel> testModels = [];
  @override
  void initState() {
    super.initState();
    fetchData();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.add,color: Colors.white,),
        title: Text("MWS",style: TextStyle(
          color: Colors.white
        ),),
        actions: [
          Icon(Icons.search,color: Colors.white,)
        ],

      ),
      body: ListView.builder(
        itemCount: testModels.length,
          itemBuilder: (BuildContext, index){
        return Card(margin: EdgeInsets.all(20),
          child: Container(
            margin: EdgeInsets.all(20),
            height: 500,
            width: 380,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 300,
                  width: 380,
                  decoration: BoxDecoration(color: Colors.grey,
                    image: DecorationImage(image: NetworkImage(testModels[index].imageLink.toString()),fit: BoxFit.fill)
                  )
                ),
               Container(margin: EdgeInsets.all(20),
                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(testModels[index].name.toString(),style: TextStyle(
                     fontSize: 13,fontWeight: FontWeight.bold)),
                     Text(testModels[index].brand.toString(),style: TextStyle(
                         fontSize: 12,)),
                    Row(
                      children: [
                        Icon(Icons.star,color: Colors.orange,),
                        Icon(Icons.star,color: Colors.orange,),
                        Icon(Icons.star,color: Colors.orange,),
                        Icon(Icons.star,color: Colors.orange,),
                        Icon(Icons.star,color: Colors.orange,),
                      ],
                    ),
                     Text(testModels[index].price.toString(),style: TextStyle(
                         fontSize: 14,fontWeight: FontWeight.bold)),

                     Text(testModels[index].description.toString(),maxLines: 2,),
                   ],
                 ),
               )
              ],
            ),
          ),
        );
      }),
    );
  }


  Future<void> fetchData() async {
    final url = Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        List<TestModel> fetchedData = [];

        for (var item in jsonData) {
          TestModel testModel = TestModel(
            name: item['name'],
            brand: item['brand'],
            price: item['price'],
            description: item['description'],
            imageLink: item['image_link'],
          );
          fetchedData.add(testModel);
        }

        setState(() {
          testModels = fetchedData; // Update the testModels list with fetched data
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
