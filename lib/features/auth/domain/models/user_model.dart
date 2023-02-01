class UserModel {
  final String? id;
  final String? name;
  final String email;
  final String password;
  final String? token;
  final String? number;
  final bool? isOnline;
  final List? addedGroups;

  UserModel({
    this.isOnline,
    this.addedGroups,
    this.id,
    this.name,
    required this.email,
    required this.password,
    this.token,
    this.number,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      token: json['token'],
      number: json['number'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? token,
    String? number,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      token: token ?? this.token,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'token': token,
      'number': number,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'],
      number: map['number'],
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, token: $token, number: $number)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.token == token &&
        other.number == number;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        password.hashCode ^
        token.hashCode ^
        number.hashCode;
  }
}
