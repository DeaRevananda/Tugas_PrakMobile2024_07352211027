import 'dart:async';

enum Role { Admin, Customer }

class Product {
  final String productName;
  final double price;
  final bool inStock;

  Product(this.productName, this.price, this.inStock);
}

class User {
  final String name;
  final int age;
  late List<Product> products;
  Role? role;

  User(this.name, this.age) {
    products = []; 
  }

  // Fungsi sinkronkan untuk mengambil detail produk yang ada (mensimulasikan panggilan server)
  Future<void> fetchProductDetails(Product product) async {
    await Future.delayed(Duration(seconds: 1));
    print("Detail produk diambil: ${product.productName}, Harga: ${product.price}");
  }
} 

// Subclass untuk AdminUser dengan hak khusus
class AdminUser extends User {
  AdminUser(String name, int age) : super(name, age) {
    role = Role.Admin;
  }

  // Metode untuk menambah produk
  void addProduct(Product product, Map<String, Product> productCatalog) {
    if (!product.inStock) {
      print("Produk ${product.productName} tidak tersedia dalam stok.");
      return;
    }
    if (!productCatalog.containsKey(product.productName)) {
      productCatalog[product.productName] = product;
      products.add(product);
      print("Produk ${product.productName} berhasil ditambahkan.");
    } else {
      print("Produk ${product.productName} sudah ada di katalog.");
    }
  }

  // Metode untuk menghapus produk
  void removeProduct(Product product) {
    products.remove(product);
    print("Produk ${product.productName} berhasil dihapus.");
  }
}

// Subclass untuk CustomerUser dengan izin melihat saja
class CustomerUser extends User {
  CustomerUser(String name, int age) : super(name, age) {
    role = Role.Customer;
  }

  // Metode untuk melihat produk
  void viewProducts() {
    if (products.isEmpty) {
      print("Tidak ada produk yang tersedia.");
    } else {
      for (var product in products) {
        print("Produk: ${product.productName}, Harga: ${product.price}, Stok: ${product.inStock}");
      }
    }
  }
}

void main() async {
  // Map untuk katalog produk
  Map<String, Product> productCatalog = {};

  // Contoh produk
  Product product1 = Product("Laptop", 1500.0, true);
  Product product2 = Product("Smartphone", 800.0, true);
  Product product3 = Product("Tablet", 400.0, false);

  // Membuat pengguna Admin dan menambahkan produk
  AdminUser admin = AdminUser("Alice", 30);
  admin.addProduct(product1, productCatalog);
  admin.addProduct(product2, productCatalog);

  // Menangani produk yang habis stok
  admin.addProduct(product3, productCatalog);

  // Membuat pengguna Customer dan menampilkan daftar produk
  CustomerUser customer = CustomerUser("Bob", 25);
  customer.products = List.from(admin.products); 
  customer.viewProducts();

  // Mengambil detail produk secara asinkron
  await admin.fetchProductDetails(product1);
}