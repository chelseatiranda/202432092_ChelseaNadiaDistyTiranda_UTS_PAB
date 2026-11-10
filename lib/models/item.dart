class Item {
  final String name;
  final String description;
  final String location;
  final String time;
  final String imagePath;
  final bool isNetworkImage;
  final bool isLost;

  Item({
    required this.name,
    required this.description,
    required this.location,
    required this.time,
    required this.imagePath,
    this.isNetworkImage = false,
    required this.isLost,
  });
}