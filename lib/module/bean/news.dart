class News {
	int pageTotal;
	List<NewsList> xList;

	News({this.pageTotal, this.xList});

	News.fromJson(Map<String, dynamic> json) {
		pageTotal = json['pageTotal'];
		if (json['list'] != null) {
			xList = new List<NewsList>();(json['list'] as List).forEach((v) { xList.add(new NewsList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['pageTotal'] = this.pageTotal;
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class NewsList {
	String newsUnitId;
	int lcid;
	List<String> newsAudios;
	List<String> newsImages;
	int pubDate;
	int tagInfo;
	String sourceUrl;
	int styleType;
	int newsId;
	String newsLogoImg;
	String shareImageLogo;
	List<Null> newsVideos;
	int sourceType;
	String newsTitle;
	String newsName;

	NewsList({this.newsUnitId, this.lcid, this.newsAudios, this.newsImages, this.pubDate, this.tagInfo, this.sourceUrl, this.styleType, this.newsId, this.newsLogoImg, this.shareImageLogo, this.newsVideos, this.sourceType, this.newsTitle, this.newsName});

	NewsList.fromJson(Map<String, dynamic> json) {
		newsUnitId = json['newsUnitId'];
		lcid = json['lcid'];
		newsAudios = json['newsAudios']?.cast<String>();
		newsImages = json['newsImages']?.cast<String>();
		pubDate = json['pubDate'];
		tagInfo = json['tagInfo'];
		sourceUrl = json['sourceUrl'];
		styleType = json['styleType'];
		newsId = json['newsId'];
		newsLogoImg = json['newsLogoImg'];
		shareImageLogo = json['shareImageLogo'];
		if (json['newsVideos'] != null) {
			newsVideos = new List<Null>();
		}
		sourceType = json['sourceType'];
		newsTitle = json['newsTitle'];
		newsName = json['newsName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['newsUnitId'] = this.newsUnitId;
		data['lcid'] = this.lcid;
		data['newsAudios'] = this.newsAudios;
		data['newsImages'] = this.newsImages;
		data['pubDate'] = this.pubDate;
		data['tagInfo'] = this.tagInfo;
		data['sourceUrl'] = this.sourceUrl;
		data['styleType'] = this.styleType;
		data['newsId'] = this.newsId;
		data['newsLogoImg'] = this.newsLogoImg;
		data['shareImageLogo'] = this.shareImageLogo;
		if (this.newsVideos != null) {
      data['newsVideos'] =  [];
    }
		data['sourceType'] = this.sourceType;
		data['newsTitle'] = this.newsTitle;
		data['newsName'] = this.newsName;
		return data;
	}
}
