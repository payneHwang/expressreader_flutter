import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Http {
//  static String baseUrl = "https://moapi.expressreadertw.com/";
  static String baseTestUrl = "https://api.expressreadertw.com/";

  static BaseOptions options = BaseOptions(
    // 请求基地址,可以包含子路径，如: "https://www.google.com/api/".
    baseUrl: baseTestUrl,
    //连接服务器超时时间，单位是毫秒.
    connectTimeout: 60000,

    ///  响应流上前后两次接受到数据的间隔，单位为毫秒。如果两次间隔超过[receiveTimeout]，
    ///  [Dio] 将会抛出一个[DioErrorType.RECEIVE_TIMEOUT]的异常.
    ///  注意: 这并不是接收数据的总时限.
    receiveTimeout: 60000,
    headers: {
      "version": "3.2.0",
//      "platform": Platform.isAndroid ? "android" : "ios",
      "platform": "android",
      "lcid": "2052",
      "appId": "02",
      "lang": "zh",
      "token": ""
    },
  );

  static Dio dio = Dio(options);

  static Future get({
    @required String path,
    Map<String, dynamic> data = const {},
    Options options,
    CancelToken cancelToken,
  }) async {
    print('get请求启动! base： $baseTestUrl,url：$path ,body: $data');
    Response response;
//    data.addAll({'key': newsKey});

    try {
      response = await dio.get(
        path,
        queryParameters: data,
        cancelToken: cancelToken,
      );
      print('get请求完成 >>> response.data：${response.data}');
      print('get请求完成 >>> response.headers：${response.headers}');
      print('get请求完成 >>> response.statusCode：${response.statusCode}');
      print('get请求完成 >>>   response.statusMessage：${response.statusMessage}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('get请求取消! ' + e.message);
      }
      print('get请求发生错误：$e');
    }
    return response.data;
  }

  static Future post({
    @required String path,
    Map<String, dynamic> data = const {},
    Options options,
    CancelToken cancelToken,
  }) async {
    print('post请求启动! url：$path ,body: $data');
    Response response;
//    data.addAll({'key': newsKey});

    try {
      response = await dio.post(
        path,
        data: data,
        cancelToken: cancelToken,
      );
      print('post请求成功!response.data：${response.data}');
      print('get请求完成 >>> response.data：${response.data}');
      print('get请求完成 >>> response.headers：${response.headers}');
      print('get请求完成 >>> response.statusCode：${response.statusCode}');
      print('get请求完成 >>>   response.statusMessage：${response.statusMessage}');
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        print('post请求取消! ' + e.message);
      }
      print('post请求发生错误：$e');
    }
    return response.data;
  }
}
