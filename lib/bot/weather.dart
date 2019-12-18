import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:math' as Math;
import 'package:http/http.dart' as http;

void main() => runApp(App());

class App extends StatefulWidget{
  @override
  AppState createState() => AppState();
}

class AppState extends State<App>
{
  
  TextEditingController _cityFieldController = new TextEditingController();
  final apiID ="5546569946b68dfac911278448b6130f";
  final defaultCity = "Kolkata";

  String _cityEntered;

  void showStuff() async {
    Map data = await getWeather(apiID,defaultCity);
    print(data.toString());
  }

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
        title: 'ClimatErr. - Know your Weather',
        debugShowCheckedModeBanner: false,
        home: Scaffold(primary: true,
        bottomNavigationBar: new Container(
                height: 100.0,
                alignment: Alignment.bottomCenter,
                margin: const EdgeInsets.fromLTRB(0.0, 40.9, 20.9, 0.0),
                child: new Text('${_cityEntered == null ? defaultCity : _cityEntered}',
                  style: cityStyle(),),
              ),
        //extendBody: true,
        appBar: AppBar(
          title: Text('Klimatic',
            style: TextStyle( fontFamily: "Quantico"),),
          leading: /*Stack(alignment: Alignment.center,children: <Widget>[Container(margin: EdgeInsets.fromLTRB(4.0, 0.0, 0.0, 8.0),child:Icon(Icons.wb_sunny,color: Colors.yellow,)),*/Icon(Icons.cloud),//,])
          actions: <Widget>[
            GestureDetector(
              child: Container(child:Icon(Icons.search),margin:EdgeInsets.fromLTRB(1.0, 0.0, 13.0, 0.0),),
              onLongPress: (){
                _cityFieldController = new TextEditingController(text:'Kolkata');
              },
              onTap: (){
                setState(() {
                  _cityEntered = _cityFieldController.text;
                });
                build(context);
              },
            )
          ],
        ),

        body: ListView(
          padding: EdgeInsets.all(10.0),
            children: <Widget>[
                   new Container(
                      margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                      child: new TextFormField(
                                decoration: new InputDecoration(
                                  hintText: 'Enter City',
                                ),
                                autofocus: false,
                              controller: _cityFieldController,
                              style: TextStyle(fontFamily: "Quantico"),
                            ),
                    ),
              //simpleData(),
              displayData(),

            ],
          ),
      ),
      theme: ThemeData.dark(),
    );
  }

  Widget dataTile({String type = "null",String value="null"})
  {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.all(Radius.circular(12.0))
              ),
              margin: EdgeInsets.fromLTRB(1.0, 5.0, 1.0, 1.0),
              height: 60.0,
              width: 60.0,
                child:Center(child:Text(value))
              ),
              Text(type)
        ],
    );
  }

  Widget simpleData()
  {
    return Container(
        decoration:BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20.0))
        ),
        height: 100.0,
        width: 100.0,
        child: Column(
          children: <Widget>[
            dataTile(type: "Temperature",value: "26*C")
          ],
        )
      );
  }
  
  Widget displayData()
  {
    return new FutureBuilder(future: getWeather(apiID, _cityEntered == null ? defaultCity : _cityEntered) , 
                  builder: (BuildContext context, AsyncSnapshot<Map> snapshot){

                    if(snapshot.hasData)
                    {
                      Map content = snapshot.data;
                      return new SizedBox(
                        height: MediaQuery.of(context).size.height/2,
                        child: Container(
                        margin: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 0.0),
                        alignment: Alignment.center,
                        child: /*Stack(
                          alignment: Alignment.center,
                          children: <Widget>[
                                      Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:<Widget>[
                                            Text(content['main']['temp'].toString() + "°C",style: new TextStyle( fontFamily: "Quantico",color: Colors.white,fontSize: 49.9, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:<Widget>[Text('Humidity:',style: TextStyle( fontFamily: "Quantico",color: Colors.cyan),),Text(content['main']['humidity'].toString(),style: TextStyle(fontFamily: "Quantico"),)]
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:<Widget>[
                                                Text('Min. Temp:\t',style: TextStyle( fontFamily: "Quantico",color: Colors.red)),Text((content['main']['temp_max']).toString(),style: TextStyle(fontFamily: "Quantico"),)
                                                ]
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:<Widget>[
                                                Text('Max. Temp:\t',style: TextStyle( fontFamily: "Quantico",color: Colors.green)),Text((content['main']['temp_min']+3).toString(),style: TextStyle(fontFamily: "Quantico"),)
                                                ]
                                            )
                                          ]
                                      ),
                                      SizedBox(
                                        height: 240.0,
                                        width: 240.0,
                                        child:CircularProgressIndicator(
                                          value: content['main']['humidity']/100,
                                          valueColor: AlwaysStoppedAnimation(Colors.cyan),
                                          strokeWidth: 6.0,
                                      )),
                                      SizedBox(
                                        height: 290.0,
                                        width: 290.0,
                                        child:CircularProgressIndicator(
                                          value: content['main']['temp_max']/(content['main']['temp_max']+5),
                                          valueColor: AlwaysStoppedAnimation(Colors.green),
                                          strokeWidth: 8.0,
                                      )),
                                      SizedBox(
                                        height: 290.0,
                                        width: 290.0,
                                        child:CircularProgressIndicator(
                                          value: content['main']['temp_min']/(content['main']['temp_min']+10),
                                          valueColor: AlwaysStoppedAnimation(Colors.red),
                                          strokeWidth: 8.0,
                                      )),

                          ],
                        )*/
                         new CustomPaint(
                              isComplex:true,
                              child: new CustomPaint(
                                        isComplex: true,
                                        child: Container(
                                          child:Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children:<Widget>[
                                            Text(content['main']['temp'].toString() + "°C",style: new TextStyle( fontFamily: "Quantico",color: Colors.white,fontSize: 49.9, fontStyle: FontStyle.normal, fontWeight: FontWeight.w500),),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:<Widget>[Text('Humidity:',style: TextStyle( fontFamily: "Quantico",color: Colors.cyan),),Text(content['main']['humidity'].toString(),style: TextStyle(fontFamily: "Quantico"),)]
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:<Widget>[
                                                Text('Max. Temp:\t',style: TextStyle( fontFamily: "Quantico",color: Colors.red)),Text(content['main']['temp_max'].toString(),style: TextStyle(fontFamily: "Quantico"),)
                                                ]
                                            ),
                                            Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children:<Widget>[
                                                Text('Min. Temp:\t',style: TextStyle( fontFamily: "Quantico",color: Colors.green)),Text(content['main']['temp_min'].toString(),style: TextStyle(fontFamily: "Quantico"),)
                                                ]
                                            )
                                          ])
                                      ),
                                        foregroundPainter: CircleProgressBarPainter(
                                          foregroundColor: Colors.cyan,
                                          percentage: content['main']['humidity']/100,
                                          side: 270.0
                                        ),
                                ),
                            foregroundPainter: CircleProgressBarPainter(
                              foregroundColor: Colors.green,
                              percentage: content['main']['temp_min']/(content['main']['temp_min']+10),
                              side:320.0,
                              strokeWidth: 10.0,
                            ),
                            painter: CircleProgressBarPainter(
                              foregroundColor: Colors.red,
                              percentage: content['main']['temp_max']/(content['main']['temp_max']+5),
                              side:220.0,
                              strokeWidth: 10.0,
                            ),
                        )
                      )
                      );
                } else {
                  return new Container();
                }
              });
  }
  Future<Map> getWeather(String apiId, String city) async {
      String apiURL = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiId&units=metric';

      http.Response response = await http.get(apiURL);
      print(json.decode(response.body));
      return json.decode(response.body);
  }

}

class CircleProgressBarPainter extends CustomPainter {
  final double percentage;
  final double strokeWidth;
  final Color backgroundColor;
  final Color foregroundColor;
  final double side;

  CircleProgressBarPainter({
    this.backgroundColor,
    this.side,
    @required this.foregroundColor,
    @required this.percentage,
    double strokeWidth,
  }) : this.strokeWidth = strokeWidth ?? 6;

  @override
  void paint(Canvas canvas, Size size) 
  {
    final Offset center = size.center(Offset.zero);
    final shortestSide = this.side;
    final foregroundPaint = Paint()
      ..color = this.foregroundColor
      ..strokeWidth = this.strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    final radius = (shortestSide / 2);

    // Start at the top. 0 radians represents the right edge
    final double startAngle = -(2 * Math.pi * 0.25);
    final double sweepAngle = (2 * Math.pi * (this.percentage ?? 0));

    // Don't draw the background if we don't have a background color
    if (this.backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = this.backgroundColor
        ..strokeWidth = this.strokeWidth
        ..style = PaintingStyle.stroke;
      canvas.drawCircle(center, radius, backgroundPaint);
    }

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      foregroundPaint,
    );

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final oldPainter = (oldDelegate as CircleProgressBarPainter);
    return oldPainter.percentage != this.percentage ||
        oldPainter.backgroundColor != this.backgroundColor ||
        oldPainter.foregroundColor != this.foregroundColor ||
        oldPainter.strokeWidth != this.strokeWidth;
  }
}

TextStyle cityStyle(){
  return new TextStyle( fontFamily: "Quantico",
    color: Colors.white,
    fontSize: 60,
  );
}

TextStyle tempStyle(){
  return new TextStyle( fontFamily: "Quantico",
    color: Colors.white,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500,
    fontSize: 49.9
  );
}
