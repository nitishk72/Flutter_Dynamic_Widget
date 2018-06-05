import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<DynamicWidget> listDynamic = [];
  List<String> data = [];

  addDynamic() {
    if (listDynamic.length >= 5) {
      return;
    }
    listDynamic.add(new DynamicWidget());
    setState(() {});
  }

  submitData(){
    data = [];
    listDynamic.forEach((widget)=>data.add(widget.controller.text));
    

  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Dynamic App'),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new Flexible(
                  child: new ListView.builder(
                      itemCount: listDynamic.length,
                      itemBuilder: (_, index) => listDynamic[index])),
              new Container(
                child: new RaisedButton(
                  onPressed: submitData,
                  child: new Text('Submit Data'),
                ),
              )
            ],
          ),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: addDynamic,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}

class DynamicWidget extends StatelessWidget {
  TextEditingController controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.all(8.0),
      child: new TextField(
        controller: controller,
        decoration: new InputDecoration(hintText: 'Enter Data '),
      ),
    );
  }
}
