import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fade_scroll_app_bar/fade_scroll_app_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:opal/widgets/MyCarousel.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:get/get.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter/rendering.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:story/story.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final ScrollController _scrollController = ScrollController();
  List weather = [1, 2, 3];
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    bool isExpanded = true;
    return SafeArea(
      child: Scaffold(
        appBar: (_currentPage == 0)
            ? null
            : AppBar(
                leadingWidth: screen_width,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
        bottomNavigationBar: BottomBar(
          // height: screen_height * 0.2,
          selectedIndex: _currentPage,
          onTap: (int index) {
            _pageController.jumpToPage(index);
            setState(
              () => _currentPage = index,
            );
            // print(_currentPage);
          },
          items: <BottomBarItem>[
            BottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Color(0xffFF4848),
            ),
            BottomBarItem(
              icon: Icon(Icons.place),
              title: Text('Place'),
              activeColor: Color(0xffFF4848),
            ),
            BottomBarItem(
              icon: Icon(Icons.people),
              title: Text('People'),
              activeColor: Color(0xffFF4848),
            ),
            BottomBarItem(
              icon: Icon(Icons.favorite),
              title: Text('Recommend'),
              activeColor: Color(0xffFF4848),
            ),
            BottomBarItem(
              icon: Icon(Icons.person),
              title: Text('My Profile'),
              activeColor: Color(0xffFF4848),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        //
        body: PageView(
          controller: _pageController,
          children: [
            MyTabPageHome(
              scrollController: _scrollController,
              weather: weather,
            ),
            MySearchingPageView(
              screen_height: screen_height,
              screen_width: screen_width,
            ),
            Container(
              color: Colors.white,
            ),
            MyTabPageRoulette(),
            MyTabViewSetting(),
          ],
          onPageChanged: (index) {
            setState(
              () => _currentPage = index,
            );
          },
        ),
      ),
    );
  }
}

class MySearchingPageView extends StatefulWidget {
  const MySearchingPageView({
    Key? key,
    required this.screen_height,
    required this.screen_width,
  }) : super(key: key);

  final double screen_height;
  final double screen_width;

  @override
  State<MySearchingPageView> createState() => _MySearchingPageViewState();
}

class _MySearchingPageViewState extends State<MySearchingPageView> {
  String _dropbox1 = "Type";
  String _dropbox2 = "People";
  bool _visible = false;
  bool key = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Timer(Duration(milliseconds: 1000), () {
        setState(() {
          _visible = true;
        });
      });
    });
  }

  void waitLoading() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    List _dropbox1_options = [
      "Exercise-oriented Type",
      "Art-appreciation Type",
      "Culture-participation Type",
      "Self-development Type",
      "Social-Contribution Type",
    ];
    List _dropbox2_options = [
      "1    ",
      "2    ",
      "3    ",
      "4    ",
    ];
    List hobby = [
      "Driving a car",
      "Tennis",
      "Running",
      "Amusement park",
    ];
    List hobby_image = [
      "drive.png",
      "tennis.png",
      "running.jpeg",
      "park.png",
    ];
    List hobby2 = [
      "Amusement park",
      "Driving a car",
      "Tennis",
      "Running",
    ];
    List hobby_image2 = [
      "park.png",
      "drive.png",
      "tennis.png",
      "running.jpeg",
    ];
    List club = [
      "고려대학교 서울캠퍼스테니스장",
      "안암 ACE 테니스 클럽",
      "카이스트 경영대학원 테니스장",
      "성신여대 탑테니스 클럽",
    ];
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            30,
            0,
            30,
            0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Searching",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: widget.screen_height * 0.05,
              ),
              Row(
                children: [
                  DropdownButton(
                    hint: Text(
                      _dropbox1,
                    ),
                    items: _dropbox1_options.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      // print(value);
                      setState(() {
                        _dropbox1 = value.toString();
                      });
                    },
                  ),
                  SizedBox(
                    width: widget.screen_width * 0.05,
                  ),
                  DropdownButton(
                    hint: Text(
                      _dropbox2,
                    ),
                    items: _dropbox2_options.map(
                      (e) {
                        return DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        _dropbox2 = value.toString();
                      });
                      _visible = false;
                      waitLoading();
                      if (value == "4    ") {
                        // print("ok");
                        Timer(
                            Duration(
                              milliseconds: 1000,
                            ), () {
                          setState(() {
                            key = true;
                          });
                        });
                      } else {
                        setState(() {
                          key = false;
                        });
                      }
                    },
                  ),
                  SizedBox(
                    width: widget.screen_width * 0.05,
                  ),
                ],
              ),
              SingleChildScrollView(
                child: AnimatedOpacity(
                  opacity: _visible ? 1 : 0,
                  duration: Duration(
                    milliseconds: 1000,
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: hobby.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            showBarModalBottomSheet(
                              context: context,
                              builder: (context) => SingleChildScrollView(
                                controller: ModalScrollController.of(context),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: screen_height * 0.05,
                                    ),
                                    Card(
                                      elevation: 5,
                                      child: Container(
                                        child: Image.asset(
                                          "assets/images/map.jpeg",
                                          width: 400,
                                          height: 400,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: screen_height * 0.025,
                                    ),
                                    ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: club.length,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const Divider(
                                        indent: 15,
                                        endIndent: 15,
                                        thickness: 2,
                                      ),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ListTile(
                                          title: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.sports_tennis,
                                              ),
                                              SizedBox(
                                                width: screen_width * 0.025,
                                              ),
                                              Text(
                                                club
                                                    .elementAt(index)
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          onTap: () {},
                                        );
                                      },
                                    ),
                                    // ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 5,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    Color(0xff5BF386),
                                    Color(0xff4891FF),
                                  ],
                                ),
                              ),
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  Image.asset(
                                    key
                                        ? "assets/images/" + hobby_image2[index]
                                        : "assets/images/" + hobby_image[index],
                                    fit: BoxFit.fitHeight,
                                    height: screen_height * 0.3,
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        height: screen_height * 0.1,
                                        width: screen_width,
                                        color: Colors.white,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: screen_width * 0.01,
                                              ),
                                              SizedBox(
                                                width: screen_width * 0.05,
                                              ),
                                              Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      key
                                                          ? hobby2[index]
                                                          : hobby[index],
                                                      style: TextStyle(
                                                        fontSize: 27,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          screen_height * 0.01,
                                                    ),
                                                    Text(
                                                      "Who wants to join me?",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTabViewSetting extends StatefulWidget {
  const MyTabViewSetting({Key? key}) : super(key: key);

  @override
  State<MyTabViewSetting> createState() => _MyTabViewSettingState();
}

class _MyTabViewSettingState extends State<MyTabViewSetting> {
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            30,
            0,
            30,
            0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Profile",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: screen_height * 0.05,
              ),
              Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        150,
                        100,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        width: screen_width * 0.4,
                        child: Card(
                          elevation: 5,
                          child: Container(
                            color: Colors.white,
                            child: Image.asset("assets/images/y1102.png"),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        0,
                        0,
                        150,
                        0,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 100,
                            backgroundImage: AssetImage(
                              "assets/images/userProfile3.png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screen_height * 0.05,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "운동친화형",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: screen_height * 0.01,
                    ),
                    Text(
                      "data",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 3,
                height: screen_height * 0.075,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: Text("data"),
                  ),
                  width: screen_width * 0.8,
                  height: screen_height * 0.075,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: screen_height * 0.025,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: Text("data"),
                  ),
                  width: screen_width * 0.8,
                  height: screen_height * 0.075,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: screen_height * 0.025,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: Text("data"),
                  ),
                  width: screen_width * 0.8,
                  height: screen_height * 0.075,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: screen_height * 0.025,
              ),
              OutlinedButton(
                onPressed: () {},
                child: Container(
                  child: Center(
                    child: Text("data"),
                  ),
                  width: screen_width * 0.8,
                  height: screen_height * 0.075,
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 1.5,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyTabPageRoulette extends StatefulWidget {
  const MyTabPageRoulette({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTabPageRoulette> createState() => _MyTabPageRouletteState();
}

class _MyTabPageRouletteState extends State<MyTabPageRoulette> {
  StreamController<int> selected1 = StreamController<int>();
  StreamController<int> selected2 = StreamController<int>();
  int _num1 = 0;
  int _num2 = 0;
  bool isChip1 = true;
  bool isChip2 = true;
  bool isChip3 = true;
  bool isResult = false;

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    int num1 = 2;
    int num2 = 2;
    final items_main = <String>[
      '운동지향형',
      '자연친화형',
      '문화체험형',
    ];
    final items_sub = <String>[
      "테니스",
      "조깅",
      "놀이공원 놀러가기",
      "자동차 드라이브",
      "스포츠 관람하기",
    ];
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
          10,
          0,
          10,
          0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                15,
                0,
                0,
                0,
              ),
              child: Row(
                children: [
                  // Text(
                  //   "나를 위한 취미활동",
                  //   style: TextStyle(
                  //     fontWeight: FontWeight.w700,
                  //     fontSize: 32,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      15,
                      0,
                      0,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Recommend",
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: screen_height * 0.025,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screen_height * 0.15,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                50,
                0,
                50,
                0,
              ),
              child: Container(
                height: screen_height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: FortuneBar(
                        height: screen_height * 0.1,
                        indicators: [
                          FortuneIndicator(
                            child: RectangleIndicator(
                              borderColor: Color(0xffFF4848),
                            ),
                          ),
                        ],
                        animateFirst: false,
                        selected: selected1.stream,
                        items: [
                          for (var it in items_main)
                            FortuneItem(
                              child: Text(it),
                              style: FortuneItemStyle(
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                50,
                0,
                50,
                0,
              ),
              child: Container(
                height: screen_height * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: FortuneBar(
                        height: screen_height * 0.1,
                        indicators: [
                          FortuneIndicator(
                            child: RectangleIndicator(
                              borderColor: Color(0xffFF4848),
                            ),
                          ),
                        ],
                        animateFirst: false,
                        selected: selected2.stream,
                        items: [
                          for (var it in items_sub)
                            FortuneItem(
                              child: Text(it),
                              style: FortuneItemStyle(
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screen_height * 0.075,
            ),
            Text(
              isResult ? "${items_main[_num1]}" : "",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: screen_height * 0.0025,
            ),
            Text(
              isResult ? "${items_sub[_num2]}" : "",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: screen_height * 0.05,
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isChip1 = !isChip1;
                      });
                    },
                    child: Chip(
                      label: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                            ),
                            SizedBox(
                              width: screen_width * 0.01,
                            ),
                            Text("날씨 조건"),
                          ],
                        ),
                      ),
                      elevation: 6,
                      backgroundColor: isChip1
                          ? Color.fromARGB(255, 255, 155, 155)
                          : Colors.grey[350],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isChip2 = !isChip2;
                      });
                    },
                    child: Chip(
                      label: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                            ),
                            SizedBox(
                              width: screen_width * 0.01,
                            ),
                            Text("위치 조건"),
                          ],
                        ),
                      ),
                      elevation: 6,
                      backgroundColor: isChip2
                          ? Color.fromARGB(255, 255, 155, 155)
                          : Colors.grey[350],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isChip3 = !isChip3;
                      });
                    },
                    child: Chip(
                      label: Container(
                        width: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.check,
                            ),
                            SizedBox(
                              width: screen_width * 0.01,
                            ),
                            Text("활동 조건"),
                          ],
                        ),
                      ),
                      elevation: 6,
                      backgroundColor: isChip3
                          ? Color.fromARGB(255, 255, 155, 155)
                          : Colors.grey[350],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screen_height * 0.025,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFF4848),
              ),
              onPressed: () {
                setState(() {
                  isResult = false;
                  _num1 = Fortune.randomInt(
                    2,
                    // items_main.length,
                    2,
                  );
                  _num2 = Fortune.randomInt(
                    // 0,
                    // items_sub.length,
                    2,
                    2,
                  );
                });
                selected1.add(_num1);
                selected2.add(_num2);
                Timer timer = new Timer(new Duration(seconds: 5), () {
                  // debugPrint("Print after 5 seconds");
                  setState(() {
                    isResult = true;
                  });
                });
              },
              child: Container(
                width: screen_width * 0.75,
                height: screen_height * 0.05,
                child: Center(
                  child: Text("roll"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTabPageHome extends StatefulWidget {
  const MyTabPageHome({
    Key? key,
    required ScrollController scrollController,
    required this.weather,
  })  : _scrollController = scrollController,
        super(key: key);
  // var scroll = ScrollController();
  final ScrollController _scrollController;
  final List weather;

  @override
  State<MyTabPageHome> createState() => _MyTabPageHomeState();
}

class _MyTabPageHomeState extends State<MyTabPageHome> {
  double location = 0;
  bool isStreched = true;
  List<String> users = [
    "userProfile1.png",
    "userProfile2.png",
    "userProfile3.png",
    "userProfile4.png",
    "userProfile5.png",
    "userProfile6.png",
  ];
  List<String> username = [
    "Chris",
    "Janet",
    "Asen",
    "Jade",
    "Olivia",
    "Sandrine",
  ];
  List hobby = [
    "Tennis",
    "Running",
    "Amusement park",
    "Driving a car",
  ];
  List hobby_image = [
    "tennis.png",
    "running.jpeg",
    "park.png",
    "drive.png",
  ];
  bool isLiked = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget._scrollController.addListener(() {
      location = widget._scrollController.position.pixels;
      if (location > 300) {
        if (mounted) {
          setState(() {
            isStreched = false;
          });
        }
      } else if (location < 250) {
        if (mounted) {
          setState(() {
            isStreched = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    List club = [
      "고려대학교 서울캠퍼스테니스장",
      "안암 ACE 테니스 클럽",
      "카이스트 경영대학원 테니스장",
      "성신여대 탑테니스 클럽",
    ];
    return FadeScrollAppBar(
      appBarLeadingWidth: screen_height * 0.5,
      appBarLeading: Padding(
        padding: const EdgeInsets.fromLTRB(
          15,
          0,
          0,
          0,
        ),
        child: Row(
          children: [
            Text(
              "Home",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      elevation: 0,
      scrollController: widget._scrollController,
      pinned: true,
      fadeOffset: 120,
      expandedHeight: screen_height * 0.6,
      backgroundColor: Colors.white,
      fadeWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpperView(
            weather: widget.weather,
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            height: (isStreched) ? 0 : 75,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Row(
              children: [
                Text(
                  "My friend's favorite hobby",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screen_height * 0.02,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              10,
              0,
              10,
              0,
            ),
            height: 115,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: users.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  0,
                  10,
                  0,
                ),
                child: GestureDetector(
                  onTap: () {
                    print("object");
                  },
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    // Color(0xff5BF386),
                                    // Color(0xff4891FF),
                                    Color(0xffFF4848),
                                    Color(0xffF3D25B),
                                  ],
                                ),
                              ),
                            ), // Text(key['title']),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 80,
                              height: 80,
                              color: Colors.white,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                              width: 75,
                              height: 75,
                              child: Image.asset(
                                // "assets/images/userProfile.jpg",
                                "assets/images/" + users.elementAt(index),
                                fit: BoxFit.cover,
                              ),
                            ), // Text(key['title']),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screen_height * 0.005,
                      ),
                      Text(
                        username.elementAt(index),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screen_height * 0.05,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: hobby.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      showBarModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          controller: ModalScrollController.of(context),
                          child: Column(
                            children: [
                              SizedBox(
                                height: screen_height * 0.05,
                              ),
                              Card(
                                elevation: 5,
                                child: Container(
                                  child: Image.asset(
                                    "assets/images/map.jpeg",
                                    width: 400,
                                    height: 400,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screen_height * 0.025,
                              ),
                              ListView.separated(
                                shrinkWrap: true,
                                itemCount: club.length,
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(
                                  indent: 15,
                                  endIndent: 15,
                                  thickness: 2,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return ListTile(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.sports_tennis,
                                        ),
                                        SizedBox(
                                          width: screen_width * 0.025,
                                        ),
                                        Text(
                                          club.elementAt(index).toString(),
                                        ),
                                      ],
                                    ),
                                    onTap: () {},
                                  );
                                },
                              ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                              Color(0xff5BF386),
                              Color(0xff4891FF),
                            ],
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(
                              "assets/images/" + hobby_image[index],
                              fit: BoxFit.fitHeight,
                              height: screen_height * 0.3,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: screen_height * 0.1,
                                  width: screen_width,
                                  color: Colors.white,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: screen_width * 0.01,
                                        ),
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            CircleAvatar(
                                              radius: 35,
                                              backgroundImage: AssetImage(
                                                  "assets/images/" +
                                                      users[index + 1]),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                50,
                                                50,
                                                0,
                                                0,
                                              ),
                                              child: Card(
                                                elevation: 20,
                                                color: Colors.transparent,
                                                child: Icon(
                                                  size: 40,
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: screen_width * 0.05,
                                        ),
                                        Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                hobby[index],
                                                style: TextStyle(
                                                  fontSize: 27,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              SizedBox(
                                                height: screen_height * 0.01,
                                              ),
                                              Text(
                                                "Who wants to join me?",
                                                style: TextStyle(fontSize: 15),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isLiked = !isLiked;
                                        });
                                      },
                                      child: Icon(
                                        isLiked
                                            ? Icons.thumb_up
                                            : Icons.thumb_up,
                                        size: 32,
                                        color:
                                            isLiked ? Colors.red : Colors.grey,
                                      ),
                                    ),
                                    SizedBox(
                                      width: screen_width * 0.05,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UpperView extends StatefulWidget {
  const UpperView({
    Key? key,
    required this.weather,
  }) : super(key: key);
  final List weather;

  @override
  State<UpperView> createState() => _UpperViewState();
}

class _UpperViewState extends State<UpperView> {
  CarouselController _carouselController = CarouselController();
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    List images = [
      "assets/images/y1102.png",
      "assets/images/y1320.png",
      "assets/images/y1320.png",
      "assets/images/y1320.png",
      "assets/images/y1320.png",
    ];
    List texts = [
      "Exercise-oriented Type",
      "Art-appreciation Type",
      "Culture-participation Type",
      "Self-development Type",
      "Social-Contribution Type",
    ];
    List scores = [
      "76 Point",
      "52 Point",
      "37 Point",
      "29 Point",
      "11 Point",
    ];
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                15,
                20,
                0,
                0,
              ),
              child: Row(
                children: [
                  Text(
                    "My preference for activities",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screen_height * 0.02,
            ),
            AnimatedOpacity(
              opacity: true ? 1 : 0,
              duration: Duration(
                milliseconds: 500,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => {},
                    child: Container(
                      width: 6.0,
                      height: 6.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(
                          _current == entry.key ? 0.9 : 0.4,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            CarouselSlider.builder(
              carouselController: _carouselController,
              itemCount: images.length,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
                int pageViewIndex,
              ) =>
                  Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Image.asset(
                          images[itemIndex],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              options: CarouselOptions(
                autoPlay: true,
                height: 300,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
            Text(
              '${texts[_current]}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: screen_height * 0.015,
            ),
            Text(
              '${scores[_current]}',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 42,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
