class CompanyModel {
  int? companyId;
  String? username;
  String? email;
  String? phone;
  String? address;
  String? password;
  String? logo;
  String? description;

  CompanyModel(
      {this.companyId,
      this.username,
      this.email,
      this.phone,
      this.address,
      this.password,
      this.logo,
      this.description});

  CompanyModel.fromJson(Map<String, dynamic> json) {
    companyId = json['Company_id'];
    username = json['Username'];
    email = json['Email'];
    phone = json['Phone'];
    address = json['Address'];
    password = json['Password'];
    logo = json['Logo'];
    description = json['Description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Company_id'] = companyId;
    data['Username'] = username;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Address'] = address;
    data['Password'] = password;
    data['Logo'] = logo;
    data['Description'] = description;
    return data;
  }
}
