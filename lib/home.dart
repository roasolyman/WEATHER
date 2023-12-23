import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'detail_page.dart';
import 'extraweather.dart';

String city = "London";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff030317),
      body: Column(
        children: [CuurrentWeather(),TodayWeather()],
      ),
    );
  }
}

class CuurrentWeather extends StatefulWidget {
  @override
  State<CuurrentWeather> createState() => _CuurrentWeatherState();
}

class _CuurrentWeatherState extends State<CuurrentWeather> {
  @override
  var focusNode = FocusNode();
  bool searchBar = false;
  Widget build(BuildContext context) {
    return GestureDetector(
      child: GlowContainer(
        height: MediaQuery.of(context).size.height - 230, //يلي لونو ازرق
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.only(top: 60, left: 30, right: 30),
        glowColor: Color(0xff00A1FF), //الحدود
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Color(0xff00A1FF),
        spreadRadius: 5,
        child: Column(
          children: [
            Container(
                child: searchBar
                    ? TextField(
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Color(0xff030317), //لون الخط
                      filled: true,
                      hintText: "Enter a city name "),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (value) {
                    var temp;
                    if (temp == null) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color(0XFF030317),
                              title: Text("city not found "),
                              content: Text("please check the city name"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("ok"))
                              ],
                            );
                          });
                    }
                  },
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      CupertinoIcons.square_grid_2x2,
                      color: Colors.white,
                    ),
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.map_fill,
                          color: Colors.white,
                        ),
                        GestureDetector(
                          onTap: () {
                            searchBar = true;
                            setState(() {});
                            focusNode.requestFocus();
                          },
                          child: Text(
                            " " + city,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30),
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    )
                  ],
                )),
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(width: 0.2, color: Colors.white),
                  borderRadius: BorderRadius.circular(30)),
              child: Text(
                "updated",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 220,
              child: Stack(
                children: [
                  Image(
                    image: AssetImage('assets/sunny.png'),
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,

                    child: Center(
                      child: Column(
                        children: [
                          GlowText(
                            "18",
                            style: TextStyle(
                                height: 0.1,
                                fontSize: 30,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            city,
                            style: TextStyle(
                                fontSize: 18
                            ),

                          ),
                          Text(
                            "july 26 2023",
                            style: TextStyle(
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                    ),

                  )
                ],
              ),
            ),
            Divider(
              color: Colors.white,
            ),
            SizedBox(height: 10,),


            ExtraWeather()


          ],
        ),
      ),
    );
  }
}

class TodayWeather extends StatelessWidget {
  const TodayWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30,right: 30,top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,//خطوه بنعملها لكل صفحه جديؤه
                      MaterialPageRoute(builder: (BuildContext context){
                        return DetailPage();
                      })
                  );
                },
                child: Row(
                  children: [
                    Text("7 Days ",style: TextStyle(fontSize: 18,color: Colors.grey),),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: Colors.grey,
                      size: 15,
                    )
                  ],
                ),
              )

            ],

          ),
          SizedBox(
            height: 15,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              weatherWidge(),
              weatherWidge(),
              weatherWidge(),
              weatherWidge(),

            ],
          )
        ],
      ),
    );
  }
}
class weatherWidge extends StatelessWidget {
  const weatherWidge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(width: 0.2 ,color: Colors.white),
          borderRadius: BorderRadius.circular(35)
      ),
      child: Column(
        children: [
          Text("17"+"\u0B00",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 5,),
          Image(image: AssetImage("assets/sunny.png'"),width: 50,height:50 ,),
          SizedBox(height: 5,),
          Text(
            "12.00",
            style: TextStyle(fontSize: 16,color: Colors.grey),

          )

        ],
      ),
    );
  }
}


