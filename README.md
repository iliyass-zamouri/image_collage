# Image Collage
![Pub Version](https://img.shields.io/pub/v/image_collage?label=Image%20Collage&logo=flutter)
Easy to use image collage.
with support of network images and assets images.
Auto layout and on Image Click. 

# Features

## Image

<img src="https://raw.githubusercontent.com/iliyass-zamouri/image_collage/main/images/screenshot.png" width="400" />

## Video Recording

<img src="https://raw.githubusercontent.com/iliyass-zamouri/image_collage/main/images/screenrecord.gif" height="440" />  

# Install

https://pub.dev/packages/image_collage/install

# Usage

Use to show post images collaged like facebook.

## Basic

```dart
import 'package:image_collage/image_collage.dart';

List<Img> images;

images.add(Img(image: "https://url_goes_here"));
images.add(Img(image: "assets/image_goes_here",source: ImageSource.assets));

Container(
    color: Colors.white,
    child: Column(
        children: [
            ImageCollage(
                images: images,
                onClick: (clickedImg, images){
                    inspect(clickedImg)
                    //you can create a screen to expand the view and give clickedImg to show it
                    // because its the user selected image 
                    //and the other images for the ability to swipe between them all.
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImageViewer(clickedImg: clickedImg, images: images )));
                }
            ),
        ],
    ),
),
```

<!-- ## Customized

```
``` -->

<!-- # Contributing

1. Fork it
2. Create your feature branch (git checkout -b new_feature_branch)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin new_feature_branch)
5. Create new Pull Request -->

# License

```
MIT License

Copyright (c) 2022 Iliyass ZAMOURI

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
