class Movie {
  String title; //제목
  String openDt; // 영화 오픈일
  String audiCnt; //일별 관람객수
  String audiAcc; // 누적 관람객수
  String plot; // 영화 상세 설명
  String posters; //포스터 이미지 Url
  String vodUrl; // 예고편 동영상 Url
  String rank; // 랭킹

  Movie(
      {required this.title,
      required this.openDt,
      required this.audiCnt,
      required this.audiAcc,
      required this.plot,
      required this.posters,
      required this.vodUrl,
      required this.rank});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json["title"],
      openDt: json["openDt"],
      audiCnt: json["audiCnt"],
      audiAcc: json["audiAcc"],
      plot: json["plot"],
      posters: json["posters"],
      vodUrl: json["vodUrl"],
      rank: json["rank"],
    );
  }
}
