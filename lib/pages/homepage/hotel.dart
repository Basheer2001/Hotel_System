class Hotel {
  final String name;
  //final String location;
  final String imageUrl;
  final String des;
  final double price;
  final int id;
  bool isLiked;
  int? reviews;
  double? rating; // Define rating property

  Hotel({
    required this.name,
    //required this.location,
    required this.imageUrl,
    required this.des,
    this.reviews=0,
    required this.price,
    this.rating=0.0,
    this.isLiked=false,
    required this.id,

  });


  factory Hotel.fromJson(Map<String, dynamic> json) {
    return Hotel(
      name: json['name'],
     // location: json['location'],
      imageUrl: json['imageUrl'],
      des: json['des'],
      reviews: json['reviews'] ?? 0,
      price: json['price'].toDouble(),
      rating: json['rating']?.toDouble() ?? 0.0, // Provide default value if null
      isLiked: json['isLiked'] ?? false,
      id: json['id'],
    );
  }
}

