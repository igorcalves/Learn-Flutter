class User {
  String? name;
  String? cpf;
  String? phone;
  String? role;
  String? email;
  String? birthDay;
  double? condominiumPrice;
  String? apartmentNumber;

  User(
      {this.name,
      this.cpf,
      this.phone,
      this.role,
      this.email,
      this.birthDay,
      this.condominiumPrice,
      this.apartmentNumber});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cpf = json['cpf'];
    phone = json['phone'];
    role = json['role'];
    email = json['email'];
    birthDay = json['birthDay'];
    condominiumPrice = json['condominiumPrice'];
    apartmentNumber = json['apartmentNumber'];
  }

  static List<User> fromJsonList(List<dynamic>  jsonList) {
    return jsonList.map((json) => User.fromJson(json)).toList();
  }

  @override
  String toString() {
    return 'Name: $name\nCPF: $cpf\nPhone: $phone\nRole: $role\nEmail: $email\n '
        'BirthDay: $birthDay\nCondominiumPrice: $condominiumPrice\n '
        'ApartmentNumber: $apartmentNumber';
  }
}
