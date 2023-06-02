import 'package:get/get.dart';

import '../models/job_model_model.dart';

class JobModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return JobModel.fromJson(map);
      if (map is List)
        return map.map((item) => JobModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<JobModel?> getJobModel(int id) async {
    final response = await get('jobmodel/$id');
    return response.body;
  }

  Future<Response<JobModel>> postJobModel(JobModel jobmodel) async =>
      await post('jobmodel', jobmodel);
  Future<Response> deleteJobModel(int id) async => await delete('jobmodel/$id');
}
