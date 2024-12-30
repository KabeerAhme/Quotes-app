import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? quote, author;
  bool business = true,
      amazing = false,
      fitness = false,
      happiness = false,
      love = false;

  Future<void> fetchquote(String category) async {
    final response = await http.get(
      Uri.parse('https://api.api-ninjas.com/v1/quotes?category=$category'),
      headers: {
        'Content-Type': 'application/json',
        'x-Api-key': 'PrnkYey6Z2wD/W4mIK5Fgw==DJfjUwCJ97z7E20U',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        Map<String, dynamic> quoteData = jsonData[0];
        quote = quoteData["quote"];
        author = quoteData["author"];
        setState(() {});
      }
    }
  }

  @override
  void initState() {
    fetchquote("business");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset(
              "assets/images/wall_4.jpg",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0),
              child: Column(
                children: [
                  Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                        text: "Quot",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "sev",
                          fontSize: 40.0,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: "ify",
                        style: TextStyle(
                          color: Colors.yellowAccent,
                          fontFamily: "sev",
                          fontSize: 40.0,
                          letterSpacing: 3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ])),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 35,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        business
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                margin: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Business",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  business = true;
                                  amazing = false;
                                  fitness = false;
                                  happiness = false;
                                  love = false;
                                  await fetchquote("business");
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5.0),
                                  margin: EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    "Business",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        amazing
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                margin: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Amazing",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  business = false;
                                  amazing = true;
                                  fitness = false;
                                  happiness = false;
                                  love = false;
                                  await fetchquote("amazing");
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5.0),
                                  margin: EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    "Amazing",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        fitness
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                margin: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Fitness",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  business = false;
                                  amazing = false;
                                  fitness = true;
                                  happiness = false;
                                  love = false;
                                  await fetchquote("fitness");
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5.0),
                                  margin: EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    "Fitness",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        happiness
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                margin: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Happiness",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  business = false;
                                  amazing = false;
                                  fitness = false;
                                  happiness = true;
                                  love = false;
                                  await fetchquote("happiness");
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5.0),
                                  margin: EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    "Happiness",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        love
                            ? Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 5.0),
                                margin: EdgeInsets.only(left: 20.0),
                                decoration: BoxDecoration(
                                  color: Colors.yellow,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Text(
                                  "Love",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            : CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  business = false;
                                  amazing = false;
                                  fitness = false;
                                  happiness = false;
                                  love = true;
                                  await fetchquote("love");
                                  setState(() {});
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5.0),
                                  margin: EdgeInsets.only(left: 20.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Text(
                                    "Love",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
                    margin: EdgeInsets.only(left: 20.0, right: 20.0),
                    height: MediaQuery.of(context).size.height / 1.6,
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/bulb.png",
                            height: 50,
                          ),
                          Text(
                            "_____________________",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            quote!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "sev",
                              letterSpacing: 3,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 60.0,
                          ),
                          Text(
                            "- " + author!,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.yellow,
                              letterSpacing: 3,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
