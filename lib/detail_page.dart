import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:weatherapp/extraweather.dart';
class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xff030317),
        body:Column(
            children:[TomorrowWheather(),sevendays()

            ]

        )
    );
  }
}


class TomorrowWheather extends StatelessWidget {
  const TomorrowWheather({super.key});

  @override
  Widget build(BuildContext context) {
    return GlowContainer(
      glowColor: Color(0xff00A1FF), //الحدود
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      color: Color(0xff00A1FF),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50,right: 30, left: 30,bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);

                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),

                ),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,

                    ),
                    Text(" 7days ",
                      style: TextStyle( fontSize: 25,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Icon(Icons.more_vert,color:Colors.white ,)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of (context).size.width /2.3,
                  height: MediaQuery.of(context).size.width /2.3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/sunny.png")
                      )

                  ),

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Tomorrow",style: TextStyle(fontSize: 30,height: 0.1),),
                    Container(
                      height: 105,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GlowText(
                            "30",
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "/"+"15"+"\u00B0",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.black.withOpacity(0.3)
                            ),

                          )
                        ],
                      ),

                    ),
                    SizedBox(height: 10,),
                    Text("Cloud",style: TextStyle(fontSize: 15),)
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20,right: 50,left: 50),
            child: Column(
              children: [
                Divider(color: Colors.white,),
                SizedBox(height: 10,),
                ExtraWeather()
              ],
            ),
          )

        ],
      ),

    );
  }
}
class sevendays extends StatelessWidget {
  const sevendays({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (BuildContext context ,int index ){
            return Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Wed",
                    style: TextStyle(fontSize: 20),


                  ),
                  Container(
                    width: 135,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image(image: AssetImage("assets/sunny.png"),
                          width: 40,
                        ),
                        Text("Clear",style: TextStyle(fontSize: 20),)
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text("+" +" 30"+"\u00B0",style: TextStyle(fontSize: 20,color: Colors.grey),),
                      SizedBox(width: 5,),
                      Text("+" +" 18"+"\u00B0",style: TextStyle(fontSize: 20,color: Colors.grey),),


                    ],

                  ),
                ],
              ),
            );
          }

      ),

    );
  }
}








