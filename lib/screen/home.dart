import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  num image() {
    int max = 32;
    int randomNumber = Random().nextInt(max) + 1;
    return randomNumber;
  }

  Future getToken() async {
    var response = await Dio().get(
      "https://my.iq.group/api/selfcare/v2/autologin",
      queryParameters: {'X-Channel': "web", "Accept-Language": "en"},
    );
    print(response.data);
  }

  @override
  void initState() {
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF8F32F3),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Nashwan Abdullah",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 22,
                                color: Color(0xFF8F32F3),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Gold",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "( Active )",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: SizedBox(),
                        ),
                        Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                image();
                              });
                            },
                            child: SvgPicture.asset(
                              "assets/img/" + image().toString() + ".svg",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SleekCircularSlider(
                    appearance: CircularSliderAppearance(
                        customWidths: CustomSliderWidths(
                            trackWidth: 2,
                            progressBarWidth: 7,
                            shadowWidth: 70),
                        customColors: CustomSliderColors(
                            dotColor: Colors.white.withOpacity(0.8),
                            trackColor: Color(0xffFF8282).withOpacity(0.6),
                            progressBarColors: [
                              Color(0xFF8F32F3).withOpacity(0.9),
                              Color(0xFF8F32F3).withOpacity(0.9),
                              Color(0xffFE6490).withOpacity(0.5)
                            ],
                            shadowColor: Color(0xffFFD7E2),
                            shadowMaxOpacity: 0.08),
                        infoProperties: InfoProperties(
                            mainLabelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.bold,
                            ),
                            modifier: (double value) {
                              final day = value.toInt();
                              return '$day Days';
                            }),
                        startAngle: 180,
                        angleRange: 180,
                        size: 150.0),
                    min: 0,
                    max: 100,
                    initialValue: 12,
                  ),
                  Text(
                    "12 Days - 22 Hour - 9 Min",
                    style: TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xFF8F32F3),
                        ),
                        width: 40,
                        height: 40,
                        child: Icon(
                          Icons.ac_unit_rounded,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        'Lorem ipsum dolor...',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF303030),
                        size: 20,
                      ),
                      tileColor: Colors.transparent,
                      dense: false,
                      contentPadding:
                          EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
