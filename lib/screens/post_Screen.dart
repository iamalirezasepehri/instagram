import 'package:flutter/material.dart';
import 'package:instagram/constants/constants.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkblue,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Header(),
                ),
                SliverToBoxAdapter(
                  child: mainPost(),
                ),
                SliverPadding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 85, right: 18, left: 18),
                  sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                        childCount: 10,
                        (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Container(
                                child: Image(
                                  image: AssetImage("images/p$index.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 83,
              color: lightblue,
              child: Padding(
                padding: const EdgeInsets.only(right: 17, top: 10, left: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Draft",
                      style: TextStyle(
                        fontFamily: "GB",
                        fontSize: 16,
                        color: custompink,
                      ),
                    ),
                    Text(
                      "Gallery",
                      style: TextStyle(
                        fontFamily: "GB",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Take",
                      style: TextStyle(
                        fontFamily: "GB",
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainPost() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          child: Image(
            image: AssetImage("images/post.jpg"),
            fit: BoxFit.cover,
            width: 394,
            height: 375,
          ),
        ),
      ),
    );
  }

  Widget Header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                "POST",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.arrow_downward,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Next",
                style: TextStyle(
                  fontFamily: "GB",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Icon(
                Icons.navigate_next,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
