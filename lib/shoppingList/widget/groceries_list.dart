import 'package:flutter/material.dart';
import 'package:flutter_poc/shoppingList/model/grocery_item.dart';
import 'package:flutter_poc/shoppingList/widget/new_item.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  final List<GroceryItem> _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (BuildContext context) {
      return const NewItem();
    }));
    if (newItem == null) return;
    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      _groceryItems.remove(item);
    });
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
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text(
                "No Items are added Yet",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: ValueKey(_groceryItems[index].id),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    _removeItem(_groceryItems[index]);
                  },
                  child: ListTile(
                    leading: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                          color: _groceryItems[index].category.colorType),
                    ),
                    title: Text(
                      _groceryItems[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Text(
                      _groceryItems[index].quantity.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }),
    );
  }
}
