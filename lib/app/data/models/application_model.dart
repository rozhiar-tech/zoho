class Application {
  int? applicationId;
  int? jobId;
  int? studentId;
  String? cvLink;

  Application({this.applicationId, this.jobId, this.studentId, this.cvLink});

  Application.fromJson(Map<String, dynamic> json) {
    applicationId = json['Application_id'];
    jobId = json['Job_id'];
    studentId = json['Student_id'];
    cvLink = json['Cv_link'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Application_id'] = applicationId;
    data['Job_id'] = jobId;
    data['Student_id'] = studentId;
    data['Cv_link'] = cvLink;
    return data;
  }
}
