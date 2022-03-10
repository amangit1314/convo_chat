class User {
  late final String id;
  late final String name;
  late final String email;
  late final String avatarUrl;
  late final String bio;
  late final String location;
  late final String number;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.avatarUrl,
      required this.bio,
      required this.location,
      required this.number});

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'avatarUrl': avatarUrl,
        'bio': bio,
        'location': location,
        'number': number,
      };
}
