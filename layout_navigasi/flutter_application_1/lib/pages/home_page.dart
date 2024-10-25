import 'package:flutter/material.dart';

class Item {
  final String name;
  final int price;

  Item({required this.name, required this.price});
}

class HomePage extends StatelessWidget {
  final List<Item> item = [
    Item(name: 'Sugar', price: 5000),
    Item(name: 'Salt', price: 2000)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Item List')),
      body: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(item[index].name),
            subtitle: Text('Price: ${item[index].price}'),
          );
        },
      ),
    );
  }
}
