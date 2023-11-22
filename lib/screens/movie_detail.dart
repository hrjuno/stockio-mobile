import 'package:flutter/material.dart';
import 'package:stockio/models/product.dart';
import 'package:stockio/models/product.dart';

class DetailItem extends StatelessWidget {
  final Product item;

  const DetailItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous page
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item.fields.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Amount: ${item.fields.amount}"),
            SizedBox(height: 10),
            Text("Synopsis: ${item.fields.description}"),
          ],
        ),
      ),
    );
  }
}