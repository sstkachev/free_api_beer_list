import 'package:flutter/material.dart';
import 'package:free_api_beer_list/beer_image_screen.dart';
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
      appBar: AppBar(
        title: const Text('Beer List free API'),
      ),
      body: FutureBuilder<BeerList>(
        future: beerList,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
                itemCount: snapshot.data?.beerList?.length,
                itemExtent: 100,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                    child: Card(
                      child: ListTile(
                        onTap: () => Navigator.push(context,
                            MaterialPageRoute(builder: (_) {
                          return ImageScreen(index: index, name: "${snapshot.data?.beerList?[index].name}",);
                        })),
                        title: Text(
                          '${snapshot.data?.beerList?[index].name}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'RubikDirt',
                          ),
                        ),
                        subtitle:
                            Text('${snapshot.data?.beerList?[index].tagline}'),
                        leading: Image.network(
                            '${snapshot.data?.beerList?[index].image}'),
                        isThreeLine: true,
                      ),
                    ),
                  );
                });
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
