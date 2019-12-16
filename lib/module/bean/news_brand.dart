class NewsBrand {
	List<NewsList> xList;

	NewsBrand({this.xList});

	NewsBrand.fromJson(Map<String, dynamic> json) {
		if (json['list'] != null) {
			xList = new List<NewsList>();(json['list'] as List).forEach((v) { xList.add(new NewsList.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.xList != null) {
      data['list'] =  this.xList.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class NewsList {
	String newsCover;
	List<NewsListNewslist> newsList;
	int newsId;
	String newsLogoImg;
	int isFocus;
	String newsDesc;
	int newsPubTime;
	int newsStatus;
	String newsName;
	String newsSlogan;

	NewsList({this.newsCover, this.newsList, this.newsId, this.newsLogoImg, this.isFocus, this.newsDesc, this.newsPubTime, this.newsStatus, this.newsName, this.newsSlogan});

	NewsList.fromJson(Map<String, dynamic> json) {
		newsCover = json['newsCover'];
		if (json['newsList'] != null) {
			newsList = new List<NewsListNewslist>();(json['newsList'] as List).forEach((v) { newsList.add(new NewsListNewslist.fromJson(v)); });
		}
		newsId = json['newsId'];
		newsLogoImg = json['newsLogoImg'];
		isFocus = json['isFocus'];
		newsDesc = json['newsDesc'];
		newsPubTime = json['newsPubTime'];
		newsStatus = json['newsStatus'];
		newsName = json['newsName'];
		newsSlogan = json['newsSlogan'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['newsCover'] = this.newsCover;
		if (this.newsList != null) {
      data['newsList'] =  this.newsList.map((v) => v.toJson()).toList();
    }
		data['newsId'] = this.newsId;
		data['newsLogoImg'] = this.newsLogoImg;
		data['isFocus'] = this.isFocus;
		data['newsDesc'] = this.newsDesc;
		data['newsPubTime'] = this.newsPubTime;
		data['newsStatus'] = this.newsStatus;
		data['newsName'] = this.newsName;
		data['newsSlogan'] = this.newsSlogan;
		return data;
	}
}

class NewsListNewslist {
	String newsUnitId;
	int lcid;
	List<Null> newsAudios;
	List<Null> newsImages;
	int pubDate;
	int tagInfo;
	String sourceUrl;
	int styleType;
	int newsId;
	String newsLogoImg;
	int newsEnabled;
	String shareImageLogo;
	List<Null> newsVideos;
	int sourceType;
	String newsTitle;
	int paperEnabled;
	String newsName;

	NewsListNewslist({this.newsUnitId, this.lcid, this.newsAudios, this.newsImages, this.pubDate, this.tagInfo, this.sourceUrl, this.styleType, this.newsId, this.newsLogoImg, this.newsEnabled, this.shareImageLogo, this.newsVideos, this.sourceType, this.newsTitle, this.paperEnabled, this.newsName});

	NewsListNewslist.fromJson(Map<String, dynamic> json) {
		newsUnitId = json['newsUnitId'];
		lcid = json['lcid'];
		if (json['newsAudios'] != null) {
			newsAudios = new List<Null>();
		}
		if (json['newsImages'] != null) {
			newsImages = new List<Null>();
		}
		pubDate = json['pubDate'];
		tagInfo = json['tagInfo'];
		sourceUrl = json['sourceUrl'];
		styleType = json['styleType'];
		newsId = json['newsId'];
		newsLogoImg = json['newsLogoImg'];
		newsEnabled = json['newsEnabled'];
		shareImageLogo = json['shareImageLogo'];
		if (json['newsVideos'] != null) {
			newsVideos = new List<Null>();
		}
		sourceType = json['sourceType'];
		newsTitle = json['newsTitle'];
		paperEnabled = json['paperEnabled'];
		newsName = json['newsName'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['newsUnitId'] = this.newsUnitId;
		data['lcid'] = this.lcid;
		if (this.newsAudios != null) {
      data['newsAudios'] =  [];
    }
		if (this.newsImages != null) {
      data['newsImages'] =  [];
    }
		data['pubDate'] = this.pubDate;
		data['tagInfo'] = this.tagInfo;
		data['sourceUrl'] = this.sourceUrl;
		data['styleType'] = this.styleType;
		data['newsId'] = this.newsId;
		data['newsLogoImg'] = this.newsLogoImg;
		data['newsEnabled'] = this.newsEnabled;
		data['shareImageLogo'] = this.shareImageLogo;
		if (this.newsVideos != null) {
      data['newsVideos'] =  [];
    }
		data['sourceType'] = this.sourceType;
		data['newsTitle'] = this.newsTitle;
		data['paperEnabled'] = this.paperEnabled;
		data['newsName'] = this.newsName;
		return data;
	}
}
