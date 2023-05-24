class Students {
  final int studentId;
  final String username;
  final String password;
  final String email;
  final String phone;
  final String pictureUrl;
  final String gender;

  Students(
    this.studentId,
    this.username,
    this.password,
    this.email,
    this.phone,
    this.pictureUrl,
    this.gender,
  );

  factory Students.fromJson(Map<String, dynamic> json) {
    return Students(
      json['Student_id'],
      json['Username'],
      json['Password'],
      json['Email'],
      json['Phone'],
      json['Picture_url'],
      json['Gender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Student_id': studentId,
      'Username': username,
      'Password': password,
      'Email': email,
      'Phone': phone,
      'Picture_url': pictureUrl,
      'Gender': gender,
    };
  }
}
