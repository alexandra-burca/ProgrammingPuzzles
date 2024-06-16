class User {
  int id;
  String name;
  String email;
  String password;
  
  User (
    this.id,
    this.name,
    this.email,
    this.password,
  );

  Map<String, dynamic> toJson() => {
    'id': id.toString(),
    'name': name.toString(),
    'email': email.toString(),
    'password': password.toString(),

  };

}