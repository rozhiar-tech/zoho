import 'package:get/get.dart';

import '../models/student_model.dart';

class StudentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Student.fromJson(map);
      if (map is List)
        return map.map((item) => Student.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Student?> getStudent(int id) async {
    final response = await get('student/$id');
    return response.body;
  }

  Future<Response<Student>> postStudent(Student student) async =>
      await post('student', student);
  Future<Response> deleteStudent(int id) async => await delete('student/$id');
}
