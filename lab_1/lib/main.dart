import 'models/product.dart';

void main() {

  print("=== Danh sách ban đầu ===");

  Product.products.forEach((p) {
    print(p);
  });

  Product.add(
    Product(
      id: "P04",
      name: "Mouse",
      image: "mouse.png",
      price: 100,
    ),
  );

  Product.edit(
    Product(
      id: "P02",
      name: "IPhone 15",
      image: "iphone15.png",
      price: 1200,
    ),
  );

  print("\n=== Search Name ===");

  List<Product> result =
      Product.searchByName("phone");

  result.forEach((p) {
    print(p);
  });

  print("\n=== Find By ID ===");

  Product? found = Product.findById("P02");

  print(found);

  Product.increasePrice();

  print("\n=== Sau khi tăng giá 10% ===");
  Product.products.forEach((p) {
    print(p);
  });
}