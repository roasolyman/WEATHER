import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExtraWeather extends StatelessWidget {
  const ExtraWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Icon(
              CupertinoIcons.wind,
              color: Colors.white,
            ),
            SizedBox(height: 10,),
            Text(
              "50" + "  km/h",
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
            ),
            SizedBox(height: 10,),
            Text("wind",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              CupertinoIcons.drop,
              color: Colors.white,
            ),
            SizedBox(height: 10,),
            Text(
              "50" + "  %",
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
            ),
            SizedBox(height: 10,),
            Text("humidity",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16
              ),
            ),
          ],
        ),
        Column(
          children: [
            Icon(
              CupertinoIcons.cloud_rain,
              color: Colors.white,
            ),
            SizedBox(height: 10,),
            Text(
              "50" + "  %",
              style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),
            ),
            SizedBox(height: 10,),
            Text("rain",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16
              ),
            ),
          ],
        ),





      ],
    );
  }
}
