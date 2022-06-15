import 'package:flutter/material.dart';

import 'models/apiModel.dart';

class SecondPage extends StatefulWidget {
  final ApiModel todo;
   SecondPage({Key? key,required this.todo}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Container(
            width: double.infinity,
            child: Image.network('http://placeimg.com/800/450/fabric',fit:BoxFit.fill,),
          ),
          Padding(
            padding:  EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget.todo.name}',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Mrp ${widget.todo.variations!.where((element) => (element.name == 'Case')).map((e) => e.price).toString()}'),
                      SizedBox(
                        width: 120,
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
                                  border: Border.all(
                                      color: Colors.deepOrange, width: 3),
                                  color: Colors.deepOrange,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                            ),
                            Container(
                              width: double.infinity,
                              height: 25,
                              child: Text('Case',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold)),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.deepOrange, width: 3),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        color: Colors.green,
                        width: 100,
                        height: 25,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            '10 in Stock',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    fixedSize: Size.fromWidth(10)),
                                onPressed: () {},
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      '-',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                            Text('1'),
                            TextButton(
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    fixedSize: Size.fromWidth(10)),
                                onPressed: () {},
                                child: Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      '+',
                                      style: TextStyle(color: Colors.white),
                                    ))),
                          ],
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.deepOrange, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Sku: ${widget.todo.sku} ')),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Category: ${widget.todo.categories?.map((e) => e.name).toString()} ')),
                ),
              ],
            ),
          ),
          Table(
            columnWidths:  {0:FixedColumnWidth(150),1:FixedColumnWidth(MediaQuery.of(context).size.width * 0.5)},
            border: TableBorder.all(color: Colors.black, style: BorderStyle.solid, width: 2),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(children: [
                Column(children: [Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Kosher Certification'),
                )]),
                Column(children:  [Text('${widget.todo.attributes!.paKosherCertification}')]),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [Text('Brand')]),
                ),
                Column(children: [Text('${widget.todo.attributes!.paBrand}')]),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [Text('Case Quantity')]),
                ),
                Column(children: [Text('${widget.todo.attributes!.paCaseQuantity}')]),
              ]),
              TableRow(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(children: [Text('Single Pack Size')]),
                ),
                Column(children: [Text('${widget.todo.attributes!.paPackSize}')]),
              ]),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size.fromWidth(double.infinity)),
                onPressed: () {},
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ))),
          ),
        ]),
      ),
    );
  }
}
