import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:esdu/models/model.dart';
import 'package:esdu/widgets/onoff.dart';

Widget ListWidget() {
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
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          staggeredTiles: const <StaggeredTile>[
            StaggeredTile.count(2, 2.7),
            StaggeredTile.count(2, 1.6),
            StaggeredTile.count(2, 3.2),
            StaggeredTile.count(2, 1.6),
          ],
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(7),
                color: Color(0xffffffff),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '   ESD LED',
                        style: TextStyle(
                          fontFamily: 'sen',
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Icon(
                        Icons.wb_incandescent,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 10),
                    Switch(
                      value: Data.info == null ? Data.recentInfo : Data.info,
                      onChanged: (bool value) {
                        if (value == false) {
                          off();
                        } else {
                          on();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(7),
                color: Color(0xffFB7B4A),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '  Temperature',
                        style:
                            TextStyle(fontFamily: 'sen', color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        Data.temp == null
                            ? Data.recentTemp.toString()
                            : Data.temp.toString(),
                        style: TextStyle(
                          fontFamily: 'sen',
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/back.jpg",
                fit: BoxFit.cover,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: const EdgeInsets.all(7),
                color: Color(0xff6D7DD2),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '  Humidity',
                        style:
                            TextStyle(fontFamily: 'sen', color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Text(
                        Data.humi == null
                            ? Data.recentHumi.toString()
                            : Data.humi.toString(),
                        style: TextStyle(
                          fontFamily: 'sen',
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
