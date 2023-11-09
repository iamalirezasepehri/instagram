import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram/constants/constants.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(top: 18, right: 18),
                    child: Icon(Icons.menu),
                  ),
                ],
                bottom: PreferredSize(
                  child: Container(
                    height: 14,
                    decoration: BoxDecoration(
                      color: darkblue,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                  ),
                  preferredSize: Size.fromHeight(10),
                ),
                backgroundColor: darkblue,
                expandedHeight: 170,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "images/p1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: getHeaderProfile(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: customgrey,
                      side: BorderSide(
                        width: 2,
                        color: customgrey,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("edite"),
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: TaskbarViewDeligate(
                  TabBar(
                    indicatorPadding: EdgeInsets.only(bottom: 5),
                    indicatorWeight: 2,
                    indicatorColor: custompink,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.image),
                      ),
                      Tab(
                        icon: Icon(Icons.bookmark),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverPadding(
                      padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                      sliver: gridListCustom()),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverPadding(
                      padding: EdgeInsets.only(top: 20, left: 18, right: 18),
                      sliver: gridListCustom()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getHeaderProfile() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: custompink,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(
                  "images/profile.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Container(
            height: 70,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "علیرضا دانشور",
                    style: TextStyle(
                      color: customgrey,
                      fontFamily: "shabnam",
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "aliza_sepehri",
                    style: TextStyle(
                      color: customgrey,
                      fontFamily: "GB",
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.edit,
            color: customgrey,
          ),
        ],
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
          QuiltedGridTile(1, 1),
          QuiltedGridTile(2, 2),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
          QuiltedGridTile(1, 1),
        ],
      ),
    );
  }
}

class TaskbarViewDeligate extends SliverPersistentHeaderDelegate {
  TaskbarViewDeligate(this.tabbar);
  final TabBar tabbar;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(color: darkblue, child: tabbar);
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => tabbar.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => tabbar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
