import 'package:dio/dio.dart';
import 'package:expressreader_flutter/net/api_service.dart';
import 'package:expressreader_flutter/net/http.dart';

class NewsFactory {
  static Future getExpressNews(
      String lcid, int pgInd, int pgLen, String timing) async {
    return await Http.get(
        path: ApiService.getExpressNews,
        data: {
          "pgInd": pgInd,
          "pgLen": pgLen,
          "timing": timing,
          "channelId": ""
        },
        options: new Options(headers: {"lcid": "2052"}));
  }

  static Future getNewsDetail(String lcid, String newsUnitId) async {
    return await Http.get(
        path: ApiService.getNewsDetail(newsUnitId),
        options: new Options(headers: {"lcid": lcid}));
  }
}
