import 'package:get/get.dart';

import '../models/application_model.dart';

class ApplicationProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return Application.fromJson(map);
      if (map is List)
        return map.map((item) => Application.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<Application?> getApplication(int id) async {
    final response = await get('application/$id');
    return response.body;
  }

  Future<Response<Application>> postApplication(
          Application application) async =>
      await post('application', application);
  Future<Response> deleteApplication(int id) async =>
      await delete('application/$id');
}
