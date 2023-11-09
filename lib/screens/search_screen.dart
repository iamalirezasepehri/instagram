import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/constants/constants.dart';

class SearchScree extends StatelessWidget {
  SearchScree({super.key});
  var category = ["All", "Acounts", "Hashtags", "Caption", "Story", "Comments"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: searchBar(),
            ),
            SliverToBoxAdapter(
              child: listOfCategory(),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: gridListCustom(),
            ),
          ],
        ),
      ),
    );
  }

  Widget gridListCustom() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            child: Image(
              image: AssetImage("images/p$index.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        childCount: 10,
      ),
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: [
          QuiltedGridTile(2, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
    );
  }

  Widget searchBar() {
    return Container(
      margin: EdgeInsets.only(left: 18, right: 18, top: 15),
      height: 46,
      decoration: BoxDecoration(
        color: lightblue,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "SEARCH",
                  hintStyle: TextStyle(
                      fontFamily: "GB", color: Colors.white, fontSize: 18),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width: 15),
            Icon(
              Icons.document_scanner,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget listOfCategory() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(right: 16, left: 16),
            decoration: BoxDecoration(
              color: lightblue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
                child: Text(
                  category[index],
                  style: TextStyle(
                    fontFamily: "GM",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
