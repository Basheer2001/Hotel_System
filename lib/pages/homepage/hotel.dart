class Hotel {
  final String name;
  final String location;
  final String imageUrl;
  final String des;
  final double price;
  bool isLiked;
  int? reviews;
  double? rating; // Define rating property

  Hotel({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.des,
    this.reviews,
    required this.price,
    this.rating,
    this.isLiked=false,

  });


}