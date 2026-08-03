// 基于 Dio 进行二次封装

import 'package:dio/dio.dart';
import 'package:hm_shop/constants/index.dart';

class Diorequest {
  final _dio = Dio();

  // 基础地址拦截器
  Diorequest() {
    _dio.options
      ..baseUrl = GlobalConstants.BASE_URL
      ..connectTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..receiveTimeout = Duration(seconds: GlobalConstants.TIME_OUT)
      ..sendTimeout = Duration(seconds: GlobalConstants.TIME_OUT);
    // 拦截器


  }

  // 添加拦截器
  void _addInterceptor() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest:(options, handler) {
        handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode! >= 200 && response.statusCode! < 300)
        {
          handler.next(response);
          return;
        }
        handler.reject(DioException(requestOptions: response.requestOptions));
      },
      onError: (error, handler) {
        
      },
    ));
  }

}

final diorequest = Diorequest();