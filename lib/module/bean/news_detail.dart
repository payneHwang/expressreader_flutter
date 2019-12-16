class NewsDetail {
	String newsUnitId;
	int lcid;
	List<String> newsAudios;
	String htmlContext;
	int isCollect;
	String shareLink;
	List<String> newsImages;
	int pubDate;
	int tagInfo;
	String sourceUrl;
	String shareLinkPrefix;
	int styleType;
	int newsId;
	String newsLogoImg;
	String shareImageLogo;
	List<Null> newsVideos;
	int sourceType;
	String newsTitle;
	String newsName;

	NewsDetail({this.newsUnitId, this.lcid, this.newsAudios, this.htmlContext, this.isCollect, this.shareLink, this.newsImages, this.pubDate, this.tagInfo, this.sourceUrl, this.shareLinkPrefix, this.styleType, this.newsId, this.newsLogoImg, this.shareImageLogo, this.newsVideos, this.sourceType, this.newsTitle, this.newsName});

	NewsDetail.fromJson(Map<String, dynamic> json) {
		newsUnitId = json['newsUnitId'];
		lcid = json['lcid'];
		newsAudios = json['newsAudios']?.cast<String>();
		htmlContext = json['htmlContext'];
		isCollect = json['isCollect'];
		shareLink = json['shareLink'];
		newsImages = json['newsImages']?.cast<String>();
		pubDate = json['pubDate'];
		tagInfo = json['tagInfo'];
		sourceUrl = json['sourceUrl'];
		shareLinkPrefix = json['shareLinkPrefix'];
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
		data['htmlContext'] = this.htmlContext;
		data['isCollect'] = this.isCollect;
		data['shareLink'] = this.shareLink;
		data['newsImages'] = this.newsImages;
		data['pubDate'] = this.pubDate;
		data['tagInfo'] = this.tagInfo;
		data['sourceUrl'] = this.sourceUrl;
		data['shareLinkPrefix'] = this.shareLinkPrefix;
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
