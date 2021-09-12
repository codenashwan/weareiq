import 'package:flutter/material.dart';

class MyTile extends StatelessWidget {
  final IconData icon;
  final String thekey;
  final String thevalue;
  const MyTile(this.icon, this.thekey, this.thevalue, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
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
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            width: 30,
            height: 30,
            child: Icon(
              icon,
              color: Colors.red,
              size: 20,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            thekey,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 10,
              color: Colors.white70,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            thevalue,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
