import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:week7/models/apiModel.dart';
import 'package:week7/secondpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


 final  List<ApiModel> _apiModel = <ApiModel>[];

  Future<void> _fetchData() async {
    final response = await rootBundle.loadString('asset/data.json');
    final data = await jsonDecode(response);
    if(data['data']['param'] != null)
      {
        data['data']['param'].forEach((v){
          _apiModel.add(ApiModel.fromJson(v));
        });
      }
    setState((){});
  }
  @override
  void initState(){
    super.initState();
    _fetchData();
  }
  @override
  Widget build(BuildContext context) {
    _fetchData();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Category Page'),
          backgroundColor: Colors.green,
        ),
        body: GridView.builder(
            itemCount: _apiModel.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2,
                mainAxisSpacing: 1,
                childAspectRatio: (1 / 2)),
            itemBuilder: (context, index) {
              final item = _apiModel[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context, CupertinoPageRoute(builder: (context) => (_)));
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    shadowColor: Colors.black,
                    elevation: 5.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 100,
                            child: Image.network('http://placeimg.com/800/450/fabric'),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomRight:Radius.circular(10),bottomLeft: Radius.circular(10))
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 25,
                                  child: Text(
                                    'Single',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.deepOrange, width: 3),
                                      color: Colors.deepOrange,
                                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10))
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 25,
                                  child: Text('Case',
                                      textAlign: TextAlign.center,
                                      style:
                                          TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.bold)),
                                  decoration: BoxDecoration(
                                      border: Border.all(color:Colors.deepOrange,width: 3),
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10))
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          children: [
                             FittedBox(child: Text(item.categories!.map((e) => e.name).toString(), style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),),
                            SizedBox(
                              height: 10,
                            ),
                             FittedBox(
                               child: Text(
                                '${item.name}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                             ),
                            SizedBox(
                              height: 10,
                            ),
                             Text('${item.variations!.where((element) => (element.name == 'Case')).map((e) => e.price).toString()}', style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextButton(
                              style: TextButton.styleFrom(
                                  elevation: 10,
                                  shadowColor: Colors.black,
                                  fixedSize: const Size.fromWidth(150),
                                  backgroundColor: Colors.deepOrange),
                              onPressed: () {
                                Navigator.push(context, CupertinoPageRoute(builder: (_) => SecondPage(todo: item)));
                              },
                              child: const Text(
                                'Add to Card',
                                style: TextStyle(color: Colors.white),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
