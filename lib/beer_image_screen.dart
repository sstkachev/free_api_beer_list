import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_api_beer_list/beer_model.dart';

class ImageScreen extends StatelessWidget {
  final int index;
  final String name;

  const ImageScreen({Key? key, required this.index, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final beerList = getBeerList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: const TextStyle(fontFamily: 'RubikDirt'),
        ),
      ),
      body: FutureBuilder<BeerList>(
        future: beerList,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                            '${snapshot.data?.beerList?[index].image}'),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '${snapshot.data?.beerList?[index].description}',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('ZZZzzz...')
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
