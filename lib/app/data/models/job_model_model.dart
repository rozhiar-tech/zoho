class JobModel {
  int? jobId;
  String? title;
  String? description;
  int? companyId;
  String? type;
  String? gender;
  String? expiration;
  int? departmentId;

  JobModel(
      {this.jobId,
      this.title,
      this.description,
      this.companyId,
      this.type,
      this.gender,
      this.expiration,
      this.departmentId});

  JobModel.fromJson(Map<String, dynamic> json) {
    jobId = json['Job_id'];
    title = json['Title'];
    description = json['Description'];
    companyId = json['Company_id'];
    type = json['Type'];
    gender = json['Gender'];
    expiration = json['Expiration'];
    departmentId = json['Department_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Job_id'] = jobId;
    data['Title'] = title;
    data['Description'] = description;
    data['Company_id'] = companyId;
    data['Type'] = type;
    data['Gender'] = gender;
    data['Expiration'] = expiration;
    data['Department_id'] = departmentId;
    return data;
  }
}
