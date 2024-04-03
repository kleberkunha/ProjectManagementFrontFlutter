class User{
  late int id;
  late String firstName;
  late String lastName;
  late String role;
  late String email;

  User(this.id, this.firstName, this.lastName, this.role, this.email);

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    firstName = json['firstName'] as String? ?? ''; // Use the null-aware operator and provide a default value
    lastName = json['lastName'] as String? ?? ''; // Use the null-aware operator and provide a default value
    role = json['role'] as String? ?? ''; // Use the null-aware operator and provide a default value
    email = json['email'] as String? ?? ''; // Use the null-aware operator and provide a default value
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['role'] = role;

    return data;
  }

}



