class MagazineIssue {
	String issueId;
	int pageTotal;
	String issuerName;
	String urlPrefix;
	int turnType;
	int lastPageNo;
	String issueNo;
	int pubDate;
	String webpPath;
	String hdcover;
	String cover;
	int islast;
	String mgName;
	List<IssueList> pageList;
	String brandCode;

	MagazineIssue({this.issueId, this.pageTotal, this.issuerName, this.urlPrefix, this.turnType, this.lastPageNo, this.issueNo, this.pubDate, this.webpPath, this.hdcover, this.cover, this.islast, this.mgName, this.pageList, this.brandCode});

	MagazineIssue.fromJson(Map<String, dynamic> json) {
		issueId = json['issueId'];
		pageTotal = json['pageTotal'];
		issuerName = json['issuerName'];
		urlPrefix = json['urlPrefix'];
		turnType = json['turnType'];
		lastPageNo = json['lastPageNo'];
		issueNo = json['issueNo'];
		pubDate = json['pubDate'];
		webpPath = json['webpPath'];
		hdcover = json['hdcover'];
		cover = json['cover'];
		islast = json['islast'];
		mgName = json['mgName'];
		if (json['pageList'] != null) {
			pageList = new List<IssueList>();(json['pageList'] as List).forEach((v) { pageList.add(new IssueList.fromJson(v)); });
		}
		brandCode = json['brandCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['issueId'] = this.issueId;
		data['pageTotal'] = this.pageTotal;
		data['issuerName'] = this.issuerName;
		data['urlPrefix'] = this.urlPrefix;
		data['turnType'] = this.turnType;
		data['lastPageNo'] = this.lastPageNo;
		data['issueNo'] = this.issueNo;
		data['pubDate'] = this.pubDate;
		data['webpPath'] = this.webpPath;
		data['hdcover'] = this.hdcover;
		data['cover'] = this.cover;
		data['islast'] = this.islast;
		data['mgName'] = this.mgName;
		if (this.pageList != null) {
      data['pageList'] =  this.pageList.map((v) => v.toJson()).toList();
    }
		data['brandCode'] = this.brandCode;
		return data;
	}
}

class IssueList {
	List<String> thumbImage;
	List<String> pages;
	int uType;
	List<Null> videos;
	List<Null> pagesWebp;
	String title;
	List<String> thumbWebpImg;
	String mnId;

	IssueList({this.thumbImage, this.pages, this.uType, this.videos, this.pagesWebp, this.title, this.thumbWebpImg, this.mnId});

	IssueList.fromJson(Map<String, dynamic> json) {
		thumbImage = json['thumbImage']?.cast<String>();
		if (json['pages'] != null) {
			pages = new List<Null>();
		}
		uType = json['uType'];
		if (json['videos'] != null) {
			videos = new List<Null>();
		}
		if (json['pagesWebp'] != null) {
			pagesWebp = new List<Null>();
		}
		title = json['title'];
		thumbWebpImg = json['thumbWebpImg']?.cast<String>();
		mnId = json['mnId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['thumbImage'] = this.thumbImage;
		if (this.pages != null) {
      data['pages'] =  [];
    }
		data['uType'] = this.uType;
		if (this.videos != null) {
      data['videos'] =  [];
    }
		if (this.pagesWebp != null) {
      data['pagesWebp'] =  [];
    }
		data['title'] = this.title;
		data['thumbWebpImg'] = this.thumbWebpImg;
		data['mnId'] = this.mnId;
		return data;
	}
}
