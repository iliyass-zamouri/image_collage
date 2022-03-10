import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_collage/image_collage.dart';
import 'package:like_button/like_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Collage(),
    );
  }
}

class Collage extends StatefulWidget {
  Collage({Key? key}) : super(key: key);

  @override
  _CollageState createState() => _CollageState();
}

late List<Img> images;
late List<Img> images1;
late List<Img> images2;

class _CollageState extends State<Collage> {
  @override
  void initState() {
    super.initState();
    images = [
      Img(
          image:
              "https://images.unsplash.com/photo-1643779374659-70a427607bf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
      Img(
        image:
            "https://images.unsplash.com/photo-1643836437012-0d5982bd105d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      )
    ];
    images1 = [
      Img(
        image:
            "https://images.unsplash.com/photo-1643836437012-0d5982bd105d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      )
    ];
    images2 = [
      Img(
          image:
              "https://images.unsplash.com/photo-1643779374659-70a427607bf9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
      Img(
        image:
            "https://images.unsplash.com/photo-1643836437012-0d5982bd105d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      ),
      Img(
          image:
              "https://images.unsplash.com/photo-1643979870390-792a826644c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
      Img(
          image:
              "https://images.unsplash.com/photo-1643979870390-792a826644c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.3),
        appBar: AppBar(
          title: Text("Image Collage Demo"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Post 2"), Icon(Icons.more_vert)],
                        ),
                      ),
                      ImageCollage(
                        images: images1,
                        onClick: (clickedImage, images) {
                          inspect(clickedImage);
                          inspect(images);
                        },
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LikeButton(),
                            Row(
                              children: [
                                Icon(Icons.share),
                                SizedBox(width: 5),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Post 2"), Icon(Icons.more_vert)],
                        ),
                      ),
                      ImageCollage(images: images),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LikeButton(),
                            Row(
                              children: [
                                Icon(Icons.share),
                                SizedBox(width: 5),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Divider(
                thickness: 1,
                height: 1,
                color: Colors.grey,
              ),
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Post 1"), Icon(Icons.more_vert)],
                        ),
                      ),
                      ImageCollage(
                        images: [],
                        widthSize: 400,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LikeButton(),
                            Row(
                              children: [
                                Icon(Icons.share),
                                SizedBox(width: 5),
                                Icon(Icons.library_add)
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
