
import 'dart:convert';

class Shoe {
  final String id;
  final String name;
  final String description;
  final String fullDescription;
  final String image;
  final String price;
  final String createdAt;

  Shoe({
    required this.id,
    required this.name,
    required this.description,
    required this.fullDescription,
    required this.image,
    required this.price,
    required this.createdAt,
  });

  factory Shoe.fromJson(Map<String, dynamic> json) {
    return Shoe(
      id: json['id'],
      name: json['pname'],
      description: json['pdescription'],
      fullDescription: json['fdescription'],
      image: json['image'],
      price: json['price'],
      createdAt: json['created_at'],
    );
  }
}

void main() {
  const jsonText = '{"success":1,"products":[{"id":"1","pname":"Air Max","pdescription":"Glides you through the air","fdescription":"The Air Max 90, also known as the Nike Air Max III, is a classic and iconic sneaker silhouette that was first released by Nike in 1990. Designed by legendary Nike designer Tinker Hatfield, the Air Max","image":"airMax91.webp","price":"3500","created_at":"2024-04-23 07:26:03"},{"id":"2","pname":"Air Jordan1","pdescription":"Get that stylish look","fdescription":"The Air Jordan 1 is a legendary basketball shoe originally designed for NBA player Michael Jordan.","image":"nikeJ1.webp","price":"3500","created_at":"2024-04-23 07:26:03"},{"id":"3","pname":"Air Force 1","pdescription":"Get the power to be","fdescription":"The Nike Air Force 1 is a legendary sneaker that has become an iconic part of sneaker culture since its introduction in 1982. Designed by Bruce Kilgore.","image":"airForce1.webp","price":"2500","created_at":"2024-04-23 07:30:19"},{"id":"4","pname":"Air 270","pdescription":"Glides you through the air","fdescription":"The Nike Air Max 270 is a popular sneaker model that debuted in 2018. It\'s a lifestyle sneaker that combines elements of Nike\'s Air Max heritage with modern design and technology.","image":"nike270.webp","price":"3500","created_at":"2024-04-23 07:30:19"}]}';
  final parsedJson = jsonDecode(jsonText);

  final productsJson = parsedJson['products'];
  final List<Shoe> shoes = List<Shoe>.from(productsJson.map((x) => Shoe.fromJson(x)));

  for (final shoe in shoes) {
    print('Shoe ID: ${shoe.id}');
    print('Name: ${shoe.name}');
    print('Description: ${shoe.description}');
    print('Full Description: ${shoe.fullDescription}');
    print('Image: ${shoe.image}');
    print('Price: ${shoe.price}');
    print('Created At: ${shoe.createdAt}');
    print('--------------------');
  }
}