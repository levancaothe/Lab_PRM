class Product {
  String id;
  String name;
  String image;
  double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  static List<Product> products = [
    Product(
      id: "P01",
      name: "Laptop",
      image: "laptop.png",
      price: 1500,
    ),
    Product(
      id: "P02",
      name: "Phone",
      image: "phone.png",
      price: 800,
    ),
    Product(
      id: "P03",
      name: "Headphone",
      image: "headphone.png",
      price: 200,
    ),
  ];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      price: json['price'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "price": price,
    };
  }

  static void add(Product product) {
    products.add(product);
  }

  static void edit(Product updatedProduct) {
    int index =
        products.indexWhere((p) => p.id == updatedProduct.id);

    if (index != -1) {
      products[index] = updatedProduct;
    }
  }

  static List<Product> searchByName(String keyword) {
    return products.where((p) {
      return p.name
          .toLowerCase()
          .contains(keyword.toLowerCase());
    }).toList();
  }

  static List<Product> searchByPrice(
      double min, double max) {
    return products.where((p) {
      return p.price >= min && p.price <= max;
    }).toList();
  }

  static Product? findById(String id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  static void increasePrice() {
    products = products.map((p) {
      return Product(
        id: p.id,
        name: p.name,
        image: p.image,
        price: p.price * 1.1,
      );
    }).toList();
  }

  @override
  String toString() {
    return "ID: $id - Name: $name - Price: $price";
  }
}