import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:awesome_icons/awesome_icons.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Get.offNamed('/');
      //   },
      //   child: Icon(
      //     Icons.waving_hand,
      //   ),
      //   backgroundColor: Colors.amber,
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: UpperView(
          weather: [1, 2, 3, 4, 5],
        ),
        elevation: 0,
        toolbarHeight: screen_height * 0.375,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xffFF4848),
                Color(0xffF3D25B),
                // Color(0xff5BF386),
                // Color(0xff4891FF),
              ],
            ),
          ),
        ),
      ),
      body: MyLoginBody(),
    );
  }
}

class MyLoginBody extends StatefulWidget {
  const MyLoginBody({Key? key}) : super(key: key);

  @override
  State<MyLoginBody> createState() => _MyLoginBodyState();
}

class _MyLoginBodyState extends State<MyLoginBody> {
  TextEditingController _idTextEditingController = TextEditingController();
  TextEditingController _psTextEditingController = TextEditingController();
  bool _isId = false;
  bool _isPs = false;
  bool _isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              50,
              0,
              50,
              0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: screen_height * 0.05,
                ),
                Image.asset(
                  "assets/images/logo_opal.png",
                  width: screen_width * 0.2,
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                Text(
                  "인공지능 기반 여가추천 서비스",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Color(0xffFF4848),
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  controller: _idTextEditingController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '아이디',
                  ),
                  onChanged: (text) {
                    setState(() {
                      if (text.isEmpty) {
                        _isId = false;
                      } else {
                        _isId = true;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  controller: _psTextEditingController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호',
                  ),
                  onChanged: (text) {
                    setState(() {
                      if (text.isEmpty) {
                        _isPs = false;
                      } else {
                        _isPs = true;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffFF4848),
                  ),
                  onPressed: (_isId && _isPs)
                      ? () {
                          if (_idTextEditingController.text == "admin" &&
                              _psTextEditingController.text == "admin") {
                            // print("object");
                            // Fluttertoast.showToast(
                            //   msg: "DB에 등록된 사용자입니다.",
                            //   toastLength: Toast.LENGTH_SHORT,
                            //   gravity: ToastGravity.BOTTOM,
                            //   timeInSecForIosWeb: 2,
                            //   backgroundColor: Colors.green,
                            //   textColor: Colors.white,
                            //   fontSize: 16.0,
                            // );
                            Get.offNamed("home");
                          } else {
                            // Fluttertoast.showToast(
                            //   msg: "유효하지 않은 사용자입니다.",
                            //   toastLength: Toast.LENGTH_SHORT,
                            //   gravity: ToastGravity.BOTTOM,
                            //   timeInSecForIosWeb: 2,
                            //   backgroundColor: Colors.red,
                            //   textColor: Colors.white,
                            //   fontSize: 16.0,
                            // );
                          }
                        }
                      : null,
                  child: Container(
                    height: screen_height * 0.05,
                    width: screen_width * 0.75,
                    child: Center(
                      child: Text(
                        "로그인",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed("/signup");
                      },
                      child: Text(
                        "회원가입",
                        style: TextStyle(
                          color: Color(0xffFF4848),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screen_width * 0.05,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "아이디 & 비밀번호 찾기",
                        style: TextStyle(
                          color: Color(0xffFF4848),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
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
  List images = [
    'assets/images/y0779.png',
    'assets/images/y1319.png',
    'assets/images/y1203.png',
    'assets/images/y1169.png',
  ];
  List texts = [
    '가공되지 않은 보석에 숨겨진',
    '재능과 가치를 찾아드립니다.',
    '인공지능 기반 여가활동 추천시스템',
    'OPAL 모바일 앱에서 바로 확인하세요',
  ];
  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              images[itemIndex],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            options: CarouselOptions(
              autoPlayAnimationDuration: Duration(
                milliseconds: 1000,
              ),
              autoPlay: true,
              enableInfiniteScroll: false,
              // height: 300,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
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
                              : Colors.white)
                          .withOpacity(
                        _current == entry.key ? 0.9 : 0.4,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: screen_height * 0.025,
          ),
          Text(
            '${texts[_current]}',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
