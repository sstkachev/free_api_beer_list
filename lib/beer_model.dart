

class Beer {
  final String? name;
  final String? tagline;
  final String? image;

  Beer({
    this.name,
    this.tagline,
    this.image,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      image: json['image_url'] as String,
    );
  }
}

class BeerList {
  List<Beer>? beerList;

  BeerList({this.beerList});

  factory BeerList.fromJson(List json) {
    List<Beer> beers = json.map((e) => Beer.fromJson(e)).toList();
    return BeerList(beerList: beers);
  }
}
