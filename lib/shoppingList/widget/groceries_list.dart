import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_poc/shoppingList/data/categories.dart';
import 'package:flutter_poc/shoppingList/model/grocery_item.dart';
import 'package:flutter_poc/shoppingList/widget/new_item.dart';
import 'package:http/http.dart' as http;

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  List<GroceryItem> _groceryItems = [];
  var _isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        "flutter-poc-e879a-default-rtdb.firebaseio.com", "shopping-list.json");
    final response = await http.get(url);
    if (response.statusCode >= 400) {
      setState(() {
        error = "Failed To Fetch Data Please Try again later";
      });
    }
    if (response.body == "null") {
      setState(() {
        _isLoading = false;
      });
      return;
    }
    final Map<String, dynamic> listData = json.decode(response.body);
    final List<GroceryItem> loadedItems = [];
    for (final item in listData.entries) {
      final category = categories.entries
          .firstWhere(
              (catItem) => catItem.value.categoryType == item.value["category"])
          .value;
      loadedItems.add(GroceryItem(
          id: item.key,
          name: item.value["name"],
          quantity: item.value["quantity"],
          category: category));
    }
    setState(() {
      _groceryItems = loadedItems;
      _isLoading = false;
    });
    return;
  }

  void _addItem() async {
    final newItem = await Navigator.of(context)
        .push<GroceryItem>(MaterialPageRoute(builder: (BuildContext context) {
      return const NewItem();
    }));
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
    // if (newItem == null) return;
    // setState(() {
    //   _groceryItems.add(newItem);
    // });
  }

  void _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);
    final url = Uri.https("flutter-poc-e879a-default-rtdb.firebaseio.com",
        "shopping-list/${item.id}.json");
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Center(
        child: Text(error!),
      );
    }
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
      body: error != null
          ? Center(
              child: Text(error!),
            )
          : _isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _groceryItems.isEmpty
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
                                  color:
                                      _groceryItems[index].category.colorType),
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
