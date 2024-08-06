import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {

  Color buttonColor = Colors.blue;


   CounterStateful({Key? key, required this.buttonColor}) : super(key: key);


  @override
  State<CounterStateful> createState() {
    State<CounterStateful> stateClassAssociatedWithThisWidget =
        _CounterStatefulState();
    return stateClassAssociatedWithThisWidget;
  }
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;

  void increment(){

    setState(() {
      counter++;
    });

    print(counter);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        child: Icon(Icons.add),onPressed: () { increment(); },),
      body: Center(child: Text("$counter", style: TextStyle(fontSize: 30),)),
    );
  }
}
