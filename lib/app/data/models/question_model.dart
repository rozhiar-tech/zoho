class Question {
  int? questionId;
  String? text;
  int? jobId;

  Question({this.questionId, this.text, this.jobId});

  Question.fromJson(Map<String, dynamic> json) {
    questionId = json['Question_id'];
    text = json['Text'];
    jobId = json['Job_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Question_id'] = questionId;
    data['Text'] = text;
    data['Job_id'] = jobId;
    return data;
  }
}
