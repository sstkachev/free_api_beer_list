import 'dart:convert';

import 'package:http/http.dart' as http;

class Beer {
  final String? name;
  final String? tagline;
  final String? image;
  final String? description;

  Beer({
    this.name,
    this.tagline,
    this.image,
    this.description,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      name: json['name'] as String,
      tagline: json['tagline'] as String,
      image: json['image_url'] as String,
      description: json['description'] as String,
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

Future<BeerList> getBeerList() async {
  final url = Uri.parse('https://api.punkapi.com/v2/beers');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return BeerList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Error: ${response.reasonPhrase}');
  }
}
