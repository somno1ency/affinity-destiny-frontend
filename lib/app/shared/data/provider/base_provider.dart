import 'package:get/get.dart';

import 'package:affinity_destiny/shared/constant.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = AppConstant.apiUrl;

    // request interceptor
    httpClient.addRequestModifier<void>((request) {
      request.headers['Authorization'] = '123456';
      return request;
    });

    // response interceptor
    httpClient.addResponseModifier((request, response) {
      return response;
    });
  }
}
