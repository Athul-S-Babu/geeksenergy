class MovieModel {
  String? id;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  int? releasedDate;
  List<String>? productionCompany;
  String? title;
  String? language;
  dynamic runTime;
  String? genre;
  List<Voted>? voted;
  String? poster;
  int? pageViews;
  String? description;
  List<String>? upVoted;
  List<String>? downVoted;
  int? totalVoted;
  int? voting;

  MovieModel({
    this.id,
    this.director,
    this.writers,
    this.stars,
    this.releasedDate,
    this.productionCompany,
    this.title,
    this.language,
    this.runTime,
    this.genre,
    this.voted,
    this.poster,
    this.pageViews,
    this.description,
    this.upVoted,
    this.downVoted,
    this.totalVoted,
    this.voting,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["_id"],
        director: json["director"] == null
            ? []
            : List<String>.from(json["director"]!.map((x) => x)),
        writers: json["writers"] == null
            ? []
            : List<String>.from(json["writers"]!.map((x) => x)),
        stars: json["stars"] == null
            ? []
            : List<String>.from(json["stars"]!.map((x) => x)),
        releasedDate: json["releasedDate"],
        productionCompany: json["productionCompany"] == null
            ? []
            : List<String>.from(json["productionCompany"]!.map((x) => x)),
        title: json["title"],
        language: json["language"],
        runTime: json["runTime"],
        genre: json["genre"],
        voted: json["voted"] == null
            ? []
            : List<Voted>.from(json["voted"]!.map((x) => Voted.fromJson(x))),
        poster: json["poster"],
        pageViews: json["pageViews"],
        description: json["description"],
        upVoted: json["upVoted"] == null
            ? []
            : List<String>.from(json["upVoted"]!.map((x) => x)),
        downVoted: json["downVoted"] == null
            ? []
            : List<String>.from(json["downVoted"]!.map((x) => x)),
        totalVoted: json["totalVoted"],
        voting: json["voting"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "director":
            director == null ? [] : List<dynamic>.from(director!.map((x) => x)),
        "writers":
            writers == null ? [] : List<dynamic>.from(writers!.map((x) => x)),
        "stars": stars == null ? [] : List<dynamic>.from(stars!.map((x) => x)),
        "releasedDate": releasedDate,
        "productionCompany": productionCompany == null
            ? []
            : List<dynamic>.from(productionCompany!.map((x) => x)),
        "title": title,
        "language": language,
        "runTime": runTime,
        "genre": genre,
        "voted": voted == null
            ? []
            : List<dynamic>.from(voted!.map((x) => x.toJson())),
        "poster": poster,
        "pageViews": pageViews,
        "description": description,
        "upVoted":
            upVoted == null ? [] : List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": downVoted == null
            ? []
            : List<dynamic>.from(downVoted!.map((x) => x)),
        "totalVoted": totalVoted,
        "voting": voting,
      };
}

class Voted {
  List<String>? upVoted;
  List<dynamic>? downVoted;
  String? id;
  int? updatedAt;
  String? genre;

  Voted({
    this.upVoted,
    this.downVoted,
    this.id,
    this.updatedAt,
    this.genre,
  });

  factory Voted.fromJson(Map<String, dynamic> json) => Voted(
        upVoted: json["upVoted"] == null
            ? []
            : List<String>.from(json["upVoted"]!.map((x) => x)),
        downVoted: json["downVoted"] == null
            ? []
            : List<dynamic>.from(json["downVoted"]!.map((x) => x)),
        id: json["_id"],
        updatedAt: json["updatedAt"],
        genre: json["genre"],
      );

  Map<String, dynamic> toJson() => {
        "upVoted":
            upVoted == null ? [] : List<dynamic>.from(upVoted!.map((x) => x)),
        "downVoted": downVoted == null
            ? []
            : List<dynamic>.from(downVoted!.map((x) => x)),
        "_id": id,
        "updatedAt": updatedAt,
        "genre": genre,
      };
}
