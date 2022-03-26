class LoginModel {
  int? id;
  String? firstname;
  String? lastname;
  String? contact;
  String? address;
  String? emailaddress;
  String? username;
  String? password;

  LoginModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.contact,
      this.address,
      this.emailaddress,
      this.username,
      this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    contact = json['contact'];
    address = json['address'];
    emailaddress = json['emailaddress'];
    username = json['username'];
    password = json['password'];
  }
  static List<LoginModel> fromJsonList(List<dynamic> jsonLst) {
    List<LoginModel> users = [];
    jsonLst.forEach((user) {
      users.add(LoginModel.fromJson(user));
    });
    return users;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['emailaddress'] = this.emailaddress;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
