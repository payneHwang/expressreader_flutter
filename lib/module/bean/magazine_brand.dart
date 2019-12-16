///杂志品牌数据bean
class MagazineBrandBean {
  int pageTotal;
  List<MagazineList> xList;

  MagazineBrandBean({this.pageTotal, this.xList});

  MagazineBrandBean.fromJson(Map<String, dynamic> json) {
    pageTotal = json['pageTotal'];
    if (json['list'] != null) {
      xList = new List<MagazineList>();
      (json['list'] as List).forEach((v) {
        xList.add(new MagazineList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageTotal'] = this.pageTotal;
    if (this.xList != null) {
      data['list'] = this.xList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MagazineList {
  int isFocus;
  String issuerName;
  String magzName;
  List<LastIssue> lastIssue;
  String brandCode;

  MagazineList(
      {this.isFocus,
      this.issuerName,
      this.magzName,
      this.lastIssue,
      this.brandCode});

  MagazineList.fromJson(Map<String, dynamic> json) {
    isFocus = json['isFocus'];
    issuerName = json['issuerName'];
    magzName = json['magzName'];
    if (json['lastIssue'] != null) {
      lastIssue = new List<LastIssue>();
      (json['lastIssue'] as List).forEach((v) {
        lastIssue.add(new LastIssue.fromJson(v));
      });
    }
    brandCode = json['brandCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isFocus'] = this.isFocus;
    data['issuerName'] = this.issuerName;
    data['magzName'] = this.magzName;
    if (this.lastIssue != null) {
      data['lastIssue'] = this.lastIssue.map((v) => v.toJson()).toList();
    }
    data['brandCode'] = this.brandCode;
    return data;
  }
}

class LastIssue {
  String cover;
  String issueId;
  String issueNo;
  int pubDate;
  String webpPath;
  String hdcover;

  LastIssue(
      {this.cover,
      this.issueId,
      this.issueNo,
      this.pubDate,
      this.webpPath,
      this.hdcover});

  LastIssue.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    issueId = json['issueId'];
    issueNo = json['issueNo'];
    pubDate = json['pubDate'];
    webpPath = json['webpPath'];
    hdcover = json['hdcover'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['issueId'] = this.issueId;
    data['issueNo'] = this.issueNo;
    data['pubDate'] = this.pubDate;
    data['webpPath'] = this.webpPath;
    data['hdcover'] = this.hdcover;
    return data;
  }
}
