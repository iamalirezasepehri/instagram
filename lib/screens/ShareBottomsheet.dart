import 'dart:ui';

import 'package:flutter/material.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({this.controller, super.key});
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 40,
          sigmaY: 40,
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Color.fromRGBO(255, 255, 255, 0.1),
          height: 300,
          child: getContent(),
        ),
      ),
    );
  }

  Widget getContent() {
    // return GridView.builder(
    //     controller: controller,
    //     itemCount: 30,
    //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisSpacing: 20, mainAxisSpacing: 20, crossAxisCount: 4),
    //     itemBuilder: (context, index) {
    //       return Container(
    //         color: Colors.red,
    //       );
    //     });
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 22),
                    height: 5,
                    width: 67,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Share",
                        style: TextStyle(
                          fontFamily: "GB",
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                      Icon(
                        Icons.open_in_browser,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Container(
                    height: 46,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.4),
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
                            width: 8,
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "SEARCH USER",
                                hintStyle: TextStyle(
                                    fontFamily: "GB",
                                    color: Colors.white,
                                    fontSize: 18),
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return getItemGrid();
              }),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 100,
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 50),
            ),
          ],
        ),
        Positioned(
          bottom: 47,
          child: ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 13,
              ),
              child: Text("SHARE"),
            ),
          ),
        ),
      ],
    );
  }

  Widget getItemGrid() {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "images/profile.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "alireza",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "GB",
            fontSize: 12,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
