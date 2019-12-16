class MagazineReview {
	int pageTotal;
	String magzName;
	List<ReviewList> xList;
	String brandCode;

	MagazineReview({this.pageTotal, this.magzName, this.xList, this.brandCode});

	MagazineReview.fromJson(Map<String, dynamic> json) {
		pageTotal = json['pageTotal'];
		magzName = json['magzName'];
		if (json['list'] != null) {
			xList = new List<ReviewList>();(json['list'] as List).forEach((v) { xList.add(new ReviewList.fromJson(v)); });
		}
		brandCode = json['brandCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pageTotal'] = this.pageTotal;
		data['magzName'] = this.magzName;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		data['brandCode'] = this.brandCode;
		return data;
	}
}

class ReviewList {
	String cover;
	String issueId;
	String issueNo;
	int pubDate;
	String webpPath;
	String hdcover;

	ReviewList({this.cover, this.issueId, this.issueNo, this.pubDate, this.webpPath, this.hdcover});

	ReviewList.fromJson(Map<String, dynamic> json) {
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
