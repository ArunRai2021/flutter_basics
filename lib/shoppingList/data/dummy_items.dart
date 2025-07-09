import 'package:flutter_poc/shoppingList/data/categories.dart';
import 'package:flutter_poc/shoppingList/model/grocery_item.dart';
import 'package:flutter_poc/shoppingList/model/shopping_list_categoery.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories[Categories.meat]!),
];
