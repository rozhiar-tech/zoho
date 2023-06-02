class Student {
  int? studentId;
  String? username;
  String? password;
  String? email;
  String? phone;
  String? pictureUrl;
  String? gender;

  Student(
      {this.studentId,
      this.username,
      this.password,
      this.email,
      this.phone,
      this.pictureUrl,
      this.gender});

  Student.fromJson(Map<String, dynamic> json) {
    studentId = json['Student_id'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    phone = json['Phone'];
    pictureUrl = json['Picture_url'];
    gender = json['Gender'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Student_id'] = studentId;
    data['Username'] = username;
    data['Password'] = password;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Picture_url'] = pictureUrl;
    data['Gender'] = gender;
    return data;
  }
}
