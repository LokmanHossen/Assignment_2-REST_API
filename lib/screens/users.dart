class User {
  final String name;
  final String email;
  final String phone;
  final String picture;

  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.picture});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: "${json['name']['first']} ${json['name']['last']}",
      email: json['email'],
      phone: json['phone'],
      picture: json['picture']['thumbnail'],
    );
  }
}
