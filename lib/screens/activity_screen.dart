import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/models/enums/enums_activity_type.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 70,
              color: darkblue,
              child: TabBar(
                controller: tabController,
                labelStyle: TextStyle(fontFamily: "GB", fontSize: 20),
                indicatorColor: custompink,
                indicatorWeight: 4,
                indicatorPadding: EdgeInsets.symmetric(horizontal: 20),
                tabs: [
                  Tab(
                    text: "Following",
                  ),
                  Tab(
                    text: "You",
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  CustomScrollView(
                    slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(childCount: 100,
                              (context, index) {
                        return GetRow(ActivityStatus.followback);
                      })),
                    ],
                  ),
                  CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            "New",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(childCount: 2,
                              (context, index) {
                        return GetRow(ActivityStatus.likes);
                      })),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            "Today",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(childCount: 3,
                              (context, index) {
                        return GetRow(ActivityStatus.following);
                      })),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30, top: 20),
                          child: Text(
                            "This week",
                            style: TextStyle(
                              fontFamily: "GB",
                              fontSize: 24,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                          delegate: SliverChildBuilderDelegate(childCount: 10,
                              (context, index) {
                        return GetRow(ActivityStatus.followback);
                      })),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget GetRow(ActivityStatus status) {
    return ActivityText(status);
  }

  Widget ActivityText(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followback:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: custompink,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 7),
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Alireza_sepehri ",
                        style: TextStyle(
                          fontFamily: "GB",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Started following",
                        style: TextStyle(
                          fontFamily: "GM",
                          fontSize: 12,
                          color: customgrey,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "You",
                        style: TextStyle(
                          fontFamily: "GM",
                          fontSize: 12,
                          color: customgrey,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        "3min",
                        style: TextStyle(
                          fontFamily: "GM",
                          fontSize: 12,
                          color: customgrey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Activity(status),
            ],
          ),
        );
      case ActivityStatus.following:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: custompink,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 7),
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Alireza_sepehri ",
                        style: TextStyle(
                          fontFamily: "GB",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Started following you",
                        style: TextStyle(
                          fontFamily: "GM",
                          fontSize: 12,
                          color: customgrey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "3min",
                    style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12,
                      color: customgrey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Activity(status),
            ],
          ),
        );
      case ActivityStatus.likes:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: custompink,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 7),
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Alireza_sepehri ",
                        style: TextStyle(
                          fontFamily: "GB",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Like your post",
                        style: TextStyle(
                          fontFamily: "GM",
                          fontSize: 12,
                          color: customgrey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "3min",
                    style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12,
                      color: customgrey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Activity(status),
            ],
          ),
        );
      default:
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 18),
          child: Row(
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: custompink,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 7),
              SizedBox(
                width: 40,
                height: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "images/profile.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Alireza_sepehri ",
                        style: TextStyle(
                          fontFamily: "GB",
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Like your post",
                        style: TextStyle(
                          fontFamily: "GM",
                          fontSize: 12,
                          color: customgrey,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "3min",
                    style: TextStyle(
                      fontFamily: "GM",
                      fontSize: 12,
                      color: customgrey,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Activity(status),
            ],
          ),
        );
    }
  }

  Widget Activity(ActivityStatus status) {
    switch (status) {
      case ActivityStatus.followback:
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            primary: custompink,
          ),
          onPressed: () {},
          child: Text("Follow"),
        );
      case ActivityStatus.likes:
        return SizedBox(
          width: 40,
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "images/p1.jpg",
              fit: BoxFit.cover,
            ),
          ),
        );
      case ActivityStatus.following:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            "Message",
            style: TextStyle(
              fontFamily: "GB",
              fontSize: 12,
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: customgrey,
            side: BorderSide(
              width: 2,
              color: customgrey,
            ),
          ),
        );
      default:
        return OutlinedButton(
          onPressed: () {},
          child: Text(
            "Message",
            style: TextStyle(
              fontFamily: "GB",
              fontSize: 12,
            ),
          ),
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            primary: customgrey,
            side: BorderSide(
              width: 2,
              color: customgrey,
            ),
          ),
        );
    }
  }
}
