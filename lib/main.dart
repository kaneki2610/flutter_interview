import 'package:flutter/material.dart';
import 'package:flutter_interview/inherited_page.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', myChild: MyCenterWidget()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.myChild}) : super(key: key);

  final String title;
  final Widget myChild;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('1. hàm build được gọi do hàm setState được gọi');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: MyInheritedWidget(
        myData: _counter,
        child: widget.myChild
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
        child: Icon(Icons.add),
      )
    );
  }
}

class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('2. log build MyCenterWidget');
    return Center(
      child: MyText(),
    );
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final couter = MyInheritedWidget.of(context).myData;
    print('3. log build MyText với counter = $couter');
    return Text(
      "djaslkdjakd ad : $couter"
    );
  }
}



