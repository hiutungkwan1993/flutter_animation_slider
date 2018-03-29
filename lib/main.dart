import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Animation Slider',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Animation Slider'),
        ),
        body: new HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: new Duration(
        seconds: 3,
      ),
    );
    animation = new Tween(begin: 100.0, end: -100.0)
        .animate(new CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn))
          ..addListener(() {
            setState(() {});
          });
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new Container(
        child: new CustomPaint(
          painter: new Artboard(
           value: animation.value
          ),
        ),
      ),
    );
  }
}

class Artboard extends CustomPainter {
  Artboard({this.value});
  
  final double value;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    var linePaint = new Paint()
      ..color = Colors.blueAccent[700]
      ..strokeWidth = 30.0
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(new Offset(0.0, -200.0), new Offset(0.0, 200.0), linePaint);

    var paint = new Paint()
    ..color = Colors.blueAccent;

    canvas.drawRect(
        new Rect.fromCircle(center: new Offset(0.0, value), radius: 40.0), paint);

    var cirPaint = new Paint()
      ..color = Colors.greenAccent
      ..blendMode = BlendMode.multiply;
    canvas.drawCircle(new Offset(0.0, value), 50.0, cirPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
