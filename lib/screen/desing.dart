import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../http/http.dart';
import 'package:staggered_grid_view_flutter/staggered_grid_view_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    gethttpData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.settings),
          title: Text("My App"),
          centerTitle: true,
          actions: [
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Show"),
            ))
          ],
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                height: 50,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: StaggeredGridView.countBuilder(
                  staggeredTileBuilder: (index) =>
                      StaggeredTile.count(1, index.isEven ? 1.4 : 1),
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: mydata.length,
                  itemBuilder: (context, index) => MyCoustomCard(index),
                ),
              ),
            ],
          ),
        ));
  }

  MyCoustomCard(int index) => Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              mydata[index].downloadUrl.toString(),
              fit: BoxFit.cover,
            )),
      );
}
