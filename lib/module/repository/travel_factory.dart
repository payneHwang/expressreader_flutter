import 'package:dio/dio.dart';
import 'package:expressreader_flutter/net/api_service.dart';
import 'package:expressreader_flutter/net/http.dart';

class TravelFactory {
  static Future getTravelBrand(String lcid, int pgInd, int pgLen) async {
    return await Http.get(
        path: ApiService.getTravelBrand,
        data: {"pgInd": pgInd, "pgLen": pgLen},
        options: new Options(headers: {"lcid": lcid}));
  }
}
