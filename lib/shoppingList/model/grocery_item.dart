import 'package:flutter_poc/shoppingList/model/shopping_list_categoery.dart';

class GroceryItem {
  const GroceryItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final ShoppingCategory category;
}
