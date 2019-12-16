class ApiService {
  //获取新闻条目
  static String getExpressNews = "api/v1/express/news";

  //获取新闻详情
  static String getNewsDetail(String newsUnitId) {
    return "api/v1/express/news/$newsUnitId";
  }

  //获取杂志品牌
  static String getMazBrand = "api/v1/magz/brand";
  //获取杂志单元列表
  static String getMazUnit(String issueId) {
    return "api/v1/magz/issue/$issueId";
  }
  //获取往期杂志列表
  static String getMazReview(String brandCode) {
    return "api/v1/magz/brands/$brandCode";
  }

  //获取图书目录
  static String getTravelBrand = "api/v1/tour/brands";
}
