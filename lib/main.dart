import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moroccan_weather/locations.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morocco Weather',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: screenHeight / 2.4,
          child: Image.asset(
            "assets/images/background.jpg",
            height: screenHeight,
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: screenHeight / 2.4,
            width: screenWidth,
            color: Color(0xFF07121E),
          ),
        ),
        Foreground(),
      ],
    );
  }
}

class Foreground extends StatelessWidget {
  const Foreground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    var borderStyle = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: BorderRadius.all(
        Radius.circular(30),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundImage: AssetImage("assets/images/myprofile.jpeg"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTextStyle(
          style: GoogleFonts.raleway(color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "Hello Youness",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Check the weather by the city",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 35,
              ),
              TextField(
                decoration: InputDecoration(
                    border: borderStyle,
                    enabledBorder: borderStyle,
                    focusedBorder: borderStyle,
                    hintText: "Search city",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
              ),
              SizedBox(height: 150),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Locations",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Icon(Icons.more_horiz),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      side: BorderSide(width: 1, color: Colors.white),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (var location in locations)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          ColorFiltered(
                            colorFilter: ColorFilter.mode(
                                Colors.black26, BlendMode.darken),
                            child: Image.asset(location.imgUrl,
                            height: screenHeight * 0.35,
                              width: screenWidth * 0.45,
                              fit: BoxFit.fill,

                            ),
                          ),
                          Column(
                            children: [
                              Text(
                                location.text,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              Text(
                                location.timing,
                              ),
                              SizedBox(height: 40,),
                              Text(
                                "${location.temperature.toString()} °",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                              SizedBox(height: 50,),
                              Text(location.weather),
                            ],
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
