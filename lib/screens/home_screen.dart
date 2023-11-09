import 'dart:ui';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';
import 'package:instagram/screens/ShareBottomsheet.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: darkblue,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          width: 128,
          child: Image(
            image: AssetImage("images/logo.png"),
          ),
        ),
        actions: [
          Container(
            width: 24,
            height: 24,
            margin: EdgeInsets.only(right: 18),
            child: Image(
              image: AssetImage("images/direct_icon.png"),
            ),
          ),
        ],
        backgroundColor: darkblue,
        elevation: 0,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListOfStory(),
            ),
            SliverList(
              delegate:
                  SliverChildBuilderDelegate(childCount: 10, (context, index) {
                return Column(
                  children: [
                    SizedBox(height: 34),
                    HeaderPost(),
                    SizedBox(height: 20),
                    Post(context, index),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget ListOfStory() {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return index == 0 ? AddStory(context) : Story(context);
        }),
      ),
    );
  }

  Widget ListOfPost() {
    return SizedBox(
      height: 700,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(height: 34),
              HeaderPost(),
              SizedBox(height: 20),
              Post(context, index),
            ],
          );
        }),
      ),
    );
  }

  Widget Post(BuildContext context, int index) {
    return Container(
      height: 440,
      width: 394,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 0,
            bottom: 50,
            right: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image(
                image: AssetImage("images/p$index.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 15,
            child: Icon(
              Icons.play_circle,
              size: 25,
              color: Colors.white,
            ),
          ),
          Positioned(
            bottom: 15,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10.0,
                  sigmaY: 10.0,
                ),
                child: Container(
                  width: 340,
                  height: 46,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 255, 255, 0.5),
                        Color.fromRGBO(255, 255, 255, 0.2),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_outline,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "2.6k",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            "2.6k",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              barrierColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context)
                                        .viewInsets
                                        .bottom,
                                  ),
                                  child: DraggableScrollableSheet(
                                      initialChildSize: 0.4,
                                      minChildSize: 0.2,
                                      maxChildSize: 0.7,
                                      builder: (context, controller) {
                                        return ShareBottomSheet(
                                            controller: controller);
                                      }),
                                );
                              });
                        },
                        icon: Icon(
                          Icons.send_outlined,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget HeaderPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Profile(),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Alirezadaneshvar",
                  style: TextStyle(
                    fontFamily: "GB",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "تبریز",
                  style: TextStyle(
                    fontFamily: "shabnam",
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget Profile() {
    return DottedBorder(
      color: custompink,
      strokeWidth: 2,
      dashPattern: [20, 0],
      borderType: BorderType.RRect,
      radius: Radius.circular(17),
      padding: EdgeInsets.all(4),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        child: Container(
          height: 38,
          width: 38,
          child: Image(
            image: AssetImage("images/profile.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget Story(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          DottedBorder(
            color: custompink,
            strokeWidth: 2,
            dashPattern: [20, 0],
            borderType: BorderType.RRect,
            radius: Radius.circular(17),
            padding: EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Container(
                height: 58,
                width: 58,
                child: Image(
                  image: AssetImage("images/profile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "alireza",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }

  Widget AddStory(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: darkblue,
                ),
                child: Icon(
                  Icons.add,
                  color: custompink,
                  size: 30,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Text(
            "your story",
            style: Theme.of(context).textTheme.headline1,
          ),
        ],
      ),
    );
  }
}
