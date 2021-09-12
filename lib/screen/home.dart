import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:provider/provider.dart';
import 'package:test/components/mytile.dart';
import 'package:test/modules/api.dart';
import 'package:lottie/lottie.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  num image() {
    int max = 40;
    int randomNumber = Random().nextInt(max) + 1;
    return randomNumber;
  }

  void autologin() async {
    Provider.of<Api>(context, listen: false).getInformation();
  }

  @override
  void initState() {
    super.initState();
    autologin();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<Api>(
          builder: (context, api, child) {
            if (api.information.length > 0) {
              return ListView(
                padding: EdgeInsets.all(10),
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xffff512f),
                          Color(0xffdd2476),
                        ],
                      ),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
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
                              Expanded(
                                child: SizedBox(),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    api.information['data']['first_name'] +
                                        " " +
                                        api.information['data']['last_name'],
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 22,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        api.information['data']['profile_name'],
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        api.information['data']['is_expired']
                                            ? "( Expire )"
                                            : "( Active )",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 20,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
                                  trackWidth: 5,
                                  progressBarWidth: 10,
                                  shadowWidth: 70),
                              customColors: CustomSliderColors(
                                  dotColor: Color(0xffff512f).withOpacity(0.8),
                                  trackColor: Color(0xffeeee).withOpacity(0.4),
                                  progressBarColors: [
                                    Color(0xFFffff).withOpacity(0.8),
                                    Color(0xFFffff).withOpacity(0.8),
                                    Color(0xffffff).withOpacity(0.8),
                                  ],
                                  shadowColor: Color(0xffFFD7E2),
                                  shadowMaxOpacity: 0.08),
                              infoProperties: InfoProperties(
                                  mainLabelStyle: TextStyle(
                                    color: Colors.white,
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
                          initialValue: double.parse(api.information['data']
                                  ['remaining_day']
                              .toString()),
                        ),
                        Text(
                          api.information['data']['remaining_day'].toString() +
                              " Days - " +
                              api.information['data']['remaining_hour']
                                  .toString() +
                              " Hour - " +
                              api.information['data']['remaining_minute']
                                  .toString() +
                              " Min",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      MyTile(Icons.fingerprint, "Your ID",
                          api.information['data']['id'].toString()),
                      MyTile(Icons.call, "Your Phonenumber",
                          api.information['data']['phone'].toString()),
                      MyTile(Icons.rss_feed, "Your Plan",
                          api.information['data']['profile_name'].toString()),
                      MyTile(
                          Icons.cloud_upload,
                          "Uprate",
                          api.information['data']['profile_uprate'].toString() +
                              " Mbps"),
                      MyTile(
                          Icons.cloud_download,
                          "Downrate",
                          api.information['data']['profile_downrate']
                                  .toString() +
                              " Mbps"),
                      MyTile(
                          Icons.wb_sunny,
                          "Remaining",
                          api.information['data']['remaining_day'].toString() +
                              " Days"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffdd2476),
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(14),
                      ),
                      padding: EdgeInsets.all(18),
                    ),
                    child: Text(
                      'Recharge Now',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: Lottie.asset(
                  'assets/img/load.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
