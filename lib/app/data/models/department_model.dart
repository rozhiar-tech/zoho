class Department {
  int? departmentId;
  String? name;

  Department({this.departmentId, this.name});

  Department.fromJson(Map<String, dynamic> json) {
    departmentId = json['Department_id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Department_id'] = departmentId;
    data['Name'] = name;
    return data;
  }
}
