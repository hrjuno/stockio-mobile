import 'package:stockio/widgets/left_drawer.dart';
import 'package:flutter/material.dart';
import 'package:stockio/models/product.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Your Movie List',
            ),
          ),
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: ItemListPage(),
      ),
    );
  }
}

class ItemListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int itemCount = listItem.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('You have $itemCount movies'),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: itemCount,
            itemBuilder: (context, index) {
              Item currentItem = listItem[index];
              return Card(
                // Add border and padding to the ListTile
                elevation: 2.0,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(currentItem.name),
                  subtitle: Text(
                    'Amount: ${currentItem.amount}, Description: ${currentItem.description}',
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}