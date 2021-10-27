import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart';

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
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            staggeredTiles: const <StaggeredTile>[
              StaggeredTile.count(2, 2.5),
              StaggeredTile.count(2, 1.8),
              StaggeredTile.count(2, 3.2),
              StaggeredTile.count(2, 1.8),
            ],
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  color: Color(0xffffffff),
                  child: Column(),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  color: Color(0xffFB7B4A),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  color: Color(0xff9D9D9D),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  padding: const EdgeInsets.all(7),
                  color: Color(0xff6D7DD2),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
