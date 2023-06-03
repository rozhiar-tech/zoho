import 'package:get/get.dart';

import '../models/department_model.dart';

class DepartmentProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Department.fromJson(map);
      if (map is List)
        return map.map((item) => Department.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Department?> getDepartment(int id) async {
    final response = await get('department/$id');
    return response.body;
  }

  Future<Response<Department>> postDepartment(Department department) async =>
      await post('department', department);
  Future<Response> deleteDepartment(int id) async =>
      await delete('department/$id');
}
