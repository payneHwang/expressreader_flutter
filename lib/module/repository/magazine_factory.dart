import 'package:dio/dio.dart';
import 'package:expressreader_flutter/net/api_service.dart';
import 'package:expressreader_flutter/net/http.dart';

class MagazineFactory {
  static Future getMazBrand(String lcid, int pgInd, int pgLen) async {
    return await Http.post(
        path: ApiService.getMazBrand,
        data: {"pgInd": pgInd, "pgLen": pgLen},
        options: new Options(headers: {"lcid": lcid}));
  }

  static Future getMazUnit(
      String issueId, String brandCode, int turn, String lcid) async {
    return await Http.get(
        path: ApiService.getMazUnit(issueId),
        data: {"brandCode": brandCode, "turn": turn},
        options: new Options(headers: {"lcid": lcid}));
  }

  static Future getMazReview(
      String brandCode, int pgInd, int pgLen, String lcid) async {
    return await Http.get(
        path: ApiService.getMazReview(brandCode),
        data: {"pgInd": pgInd, "pgLen": pgLen},
        options: new Options(headers: {"lcid": lcid}));
  }
}
