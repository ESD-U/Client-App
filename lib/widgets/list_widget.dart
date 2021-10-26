import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22,
        right: 22,
        top: 22,
      ),
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverStaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            staggeredTiles: const <StaggeredTile>[
              StaggeredTile.count(2, 2.5),
              StaggeredTile.count(2, 1.8),
              StaggeredTile.count(2, 3.2),
              StaggeredTile.count(2, 1.8),
            ],
            children: const <Widget>[
              Card(
                color: Color(0xffffffff), // Light
              ),
              Card(
                color: Color(0xffFB7B4A), // Temperature
              ),
              Card(
                color: Color(0xff9D9D9D), // Streaming
              ),
              Card(
                color: Color(0xff6D7DD2), // Humidity
              ),
            ],
          ),
        ],
      ),
    );
  }
}
