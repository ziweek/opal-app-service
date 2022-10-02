import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:get/get.dart';

class MySignUp extends StatefulWidget {
  const MySignUp({Key? key}) : super(key: key);

  @override
  State<MySignUp> createState() => _MySignUpState();
}

class _MySignUpState extends State<MySignUp> {
  int? _toggleValue1 = null;
  int? _toggleValue2 = null;
  int? _toggleValue3 = null;
  int? _toggleValue4 = null;
  int? _toggleValue5 = null;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isButtonDisabled = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;
    double screen_height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원가입",
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                // Color(0xff5BF386),
                // Color(0xff4891FF),
                Color(0xffFF4848),
                Color(0xffF3D25B),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
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
              children: [
                SizedBox(
                  height: screen_height * 0.05,
                ),
                Row(
                  children: [
                    Text(
                      '사용자 정보 입력',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이름',
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '전화번호',
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  // obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이메일',
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  height: screen_height * 0.1,
                ),
                Row(
                  children: [
                    Text(
                      '회원 정보 입력',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '아이디',
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호',
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호 확인',
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  height: screen_height * 0.1,
                ),
                Row(
                  children: [
                    Text(
                      '회원 데이터 수집',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                Text(
                  "사용자 성별",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.01,
                ),
                ToggleSwitch(
                  minWidth: 180,
                  minHeight: 70,
                  initialLabelIndex: _toggleValue1,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 2,
                  labels: [
                    '남성',
                    '여성',
                  ],
                  icons: [
                    FontAwesomeIcons.mars,
                    FontAwesomeIcons.venus,
                  ],
                  onToggle: (index) {
                    setState(() {
                      _toggleValue1 = index;
                    });
                  },
                ),
                SizedBox(
                  height: screen_height * 0.05,
                ),
                Text(
                  "사용자 연령",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.01,
                ),
                ToggleSwitch(
                  isVertical: true,
                  customHeights: [
                    90,
                    90,
                    90,
                    90,
                    90,
                    90,
                    90,
                  ],
                  minWidth: screen_width * 0.75,
                  minHeight: 70,
                  initialLabelIndex: _toggleValue2,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 7,
                  labels: [
                    "60대 이상",
                    "50대 이상 60대 미만",
                    "40대 이상 50대 미만",
                    "30대 이상 40대 미만",
                    "20대 이상 30대 미만",
                    "10대 이상 20대 미만",
                    "10대 미만",
                  ],
                  onToggle: (index) {
                    setState(() {
                      _toggleValue2 = index;
                    });
                  },
                ),
                SizedBox(
                  height: screen_height * 0.05,
                ),
                Text(
                  "일주일에 여가에 투자하는 시간",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.01,
                ),
                ToggleSwitch(
                  isVertical: true,
                  customHeights: [
                    90,
                    90,
                    90,
                    90,
                  ],
                  minWidth: screen_width * 0.75,
                  minHeight: 70,
                  initialLabelIndex: _toggleValue4,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 4,
                  labels: [
                    "37시간 이상",
                    "27시간 이상 37시간 이내",
                    "20시간 이상 27시간 이내",
                    "20시간 미만",
                  ],
                  onToggle: (index) {
                    setState(() {
                      _toggleValue4 = index;
                    });
                  },
                ),
                SizedBox(
                  height: screen_height * 0.05,
                ),
                Text(
                  "여가를 위한 월평균 지출액",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.025,
                ),
                ToggleSwitch(
                  isVertical: true,
                  customHeights: [
                    90,
                    90,
                    90,
                    90,
                  ],
                  minWidth: screen_width * 0.75,
                  minHeight: 70,
                  initialLabelIndex: _toggleValue5,
                  cornerRadius: 20.0,
                  activeFgColor: Colors.white,
                  inactiveBgColor: Colors.grey,
                  inactiveFgColor: Colors.white,
                  totalSwitches: 4,
                  labels: [
                    "월평균 20만원 이상",
                    "월평균 20만원 미만",
                    "월평균 10만원 미만",
                    "월평균 5만원 미만",
                  ],
                  onToggle: (index) {
                    setState(() {
                      _toggleValue5 = index;
                    });
                  },
                ),
                Divider(
                  thickness: 1.5,
                  height: screen_height * 0.1,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF4848),
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(() {
                          _isChecked1 = value!;
                          // _isButtonDisabled = value;
                        });
                      },
                    ),
                    Text(
                      "위 내용을 확인하였으며, 회원가입 약관에 동의합니다.",
                    )
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.01,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Color(0xffFF4848),
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(() {
                          _isChecked2 = value!;
                          _isButtonDisabled = value;
                        });
                      },
                    ),
                    Text(
                      "개인정보보호약관에 따라 데이터 제공 및 활용에 동의합니다",
                    )
                  ],
                ),
                SizedBox(
                  height: screen_height * 0.05,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffFF4848),
                  ),
                  onPressed: _isButtonDisabled
                      ? () {
                          Get.offNamed("login");
                        }
                      : null,
                  child: Container(
                    height: screen_height * 0.05,
                    width: screen_width * 0.75,
                    child: Center(
                      child: Text(
                        "회원으로 가입하기",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screen_height * 0.05,
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
