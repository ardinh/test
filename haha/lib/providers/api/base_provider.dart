import 'package:haha/shared/shared.dart';
import 'package:get/get.dart';

import 'api.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = Environment.baseUrl;
    httpClient.timeout = const Duration(seconds: 60);
    httpClient.addAuthenticator(authInterceptor);
    httpClient.addRequestModifier(requestInterceptor);
    httpClient.addResponseModifier(responseInterceptor);
    super.onInit();
  }

  /*
  @override
  set trustedCertificates(List<TrustedCertificate> _trustedCertificates) {
  super.trustedCertificates = _trustedCertificates;
  }
  */
}
