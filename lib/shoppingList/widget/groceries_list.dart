import 'package:flutter/material.dart';
import 'package:flutter_poc/shoppingList/data/dummy_items.dart';
import 'package:flutter_poc/shoppingList/widget/new_item.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  void _addItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return const NewItem();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(
              onPressed: () {
                _addItem();
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color: groceryItems[index].category.colorType),
              ),
              title: Text(
                groceryItems[index].name,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: Text(
                groceryItems[index].quantity.toString(),
                style: const TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }
}
