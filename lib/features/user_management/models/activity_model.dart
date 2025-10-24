class Activity {
  final String id;
  final String userName;
  final String userAvatar;
  final String timestamp;
  final String description;
  final List<String> tags;
  final String? imageUrl;

  Activity({
    required this.id,
    required this.userName,
    required this.userAvatar,
    required this.timestamp,
    required this.description,
    required this.tags,
    this.imageUrl,
  });
}