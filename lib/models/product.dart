class Product {
  final String name;
  final num price;
  final String description;
  final String imagepath;
  final String category;
  int quantity;
  double totalPrice;

  Product ({
    required this.name,
    required this.price,
    required this.description,
    required this.imagepath,
    required this.category,
    this.quantity = 0,
    this.totalPrice = 0
  });

  //incremento quant
  void incrementQuantity() {
    quantity++;
    totalPrice += price;
  }
  
  //decremento quant
  void decrementQuantity() {
    quantity --;
    totalPrice -=price;
  }

  //quant inicial
  void initialQuantity() {
    quantity = 0;
    totalPrice = 0;
  }
  
}