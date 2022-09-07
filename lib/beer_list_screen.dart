import 'package:flutter/material.dart';
import 'package:free_api_beer_list/beer_model.dart';

class BeerListScreen extends StatefulWidget {
  const BeerListScreen({Key? key}) : super(key: key);

  @override
  State<BeerListScreen> createState() => _BeerListScreenState();
}

class _BeerListScreenState extends State<BeerListScreen> {
  Future<BeerList>? beerList;

  @override
  void initState() {

    super.initState();
    beerList = getBeerList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BeerList>(
        future: beerList,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data?.beerList?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('${snapshot.data?.beerList?[index].name}'),
                      subtitle: Text('${snapshot.data?.beerList?[index].tagline}'),
                    ),
                  );
                });
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
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
