import 'dart:ui';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class ShoppingCategory {
  const ShoppingCategory(this.categoryType, this.colorType);

  final Color colorType;
  final String categoryType;
}
