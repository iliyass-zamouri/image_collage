import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_collage/image_collage.dart';

void main() {
  testWidgets('ImageCollage has spacing between 2 images', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Center(
            child: ImageCollage(
              images: const [
                Img(image: 'https://example.com/1.jpg'),
                Img(image: 'https://example.com/2.jpg'),
              ],
              spacing: 12.0,
            ),
          ),
        ),
      ),
    );

    expect(find.byType(ShowImage), findsNWidgets(2));
    expect(find.byWidgetPredicate((Widget widget) {
      return widget is SizedBox && widget.width == 12.0;
    }), findsOneWidget);
  });
}

