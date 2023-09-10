import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App Name'),
      ),
      body: ListView(
        children: <Widget>[
          // Top Carousel Slider
          CarouselSlider(
            items: [
              // Add carousel items (images or widgets) here
              Image.asset('assets/images/image1.jpg'),
              Image.asset('assets/images/image2.jpg'),
              // Add more items as needed
            ],
            options:CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
            ),
          ),

          // App Name and Rating
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'App Name',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow),
                    Text('4.5 (123,456 Reviews)'),
                  ],
                ),
              ],
            ),
          ),

          // Description
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Description: Your app description goes here.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),

          // Install Button
          Padding(
            padding: EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Implement the installation logic here
              },
              child: Text('Install'),
            ),
          ),

          // Screenshots
          // You can use a ListView or GridView to display screenshots
          // Add your screenshot images or widgets here
        ],
      ),
    );
  }
}
