import 'package:get/get.dart';

import '../models/company_model.dart';

class CompanyModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return CompanyModel.fromJson(map);
      if (map is List)
        return map.map((item) => CompanyModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<CompanyModel?> getCompanyModel(int id) async {
    final response = await get('companymodel/$id');
    return response.body;
  }

  Future<Response<CompanyModel>> postCompanyModel(
          CompanyModel companymodel) async =>
      await post('companymodel', companymodel);
  Future<Response> deleteCompanyModel(int id) async =>
      await delete('companymodel/$id');
}
