class TravelBrand {
	int pageTotal;
	List<TravelBrandList> xList;

	TravelBrand({this.pageTotal, this.xList});

	TravelBrand.fromJson(Map<String, dynamic> json) {
		pageTotal = json['pageTotal'];
		if (json['list'] != null) {
			xList = new List<TravelBrandList>();(json['list'] as List).forEach((v) { xList.add(new TravelBrandList.fromJson(v)); });
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

class TravelBrandList {
	String coverPath;
	int turnType;
	String publishingHouse;
	int publishingDate;
	String bookName;
	int totalPageNo;
	String publishingAddress;
	int bookId;
	String bookLang;

	TravelBrandList({this.coverPath, this.turnType, this.publishingHouse, this.publishingDate, this.bookName, this.totalPageNo, this.publishingAddress, this.bookId, this.bookLang});

	TravelBrandList.fromJson(Map<String, dynamic> json) {
		coverPath = json['coverPath'];
		turnType = json['turnType'];
		publishingHouse = json['publishingHouse'];
		publishingDate = json['publishingDate'];
		bookName = json['bookName'];
		totalPageNo = json['totalPageNo'];
		publishingAddress = json['publishingAddress'];
		bookId = json['bookId'];
		bookLang = json['bookLang'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['coverPath'] = this.coverPath;
		data['turnType'] = this.turnType;
		data['publishingHouse'] = this.publishingHouse;
		data['publishingDate'] = this.publishingDate;
		data['bookName'] = this.bookName;
		data['totalPageNo'] = this.totalPageNo;
		data['publishingAddress'] = this.publishingAddress;
		data['bookId'] = this.bookId;
		data['bookLang'] = this.bookLang;
		return data;
	}
}
