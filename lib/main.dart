import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var result = "";
  var bgColor = Colors.lightBlueAccent.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your BMI'),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 31,),

                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight in Kg'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),

                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in Feet'),
                    prefixIcon: Icon(Icons.height_rounded)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Height in inch'),
                    prefixIcon: Icon(Icons.height_rounded)
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 16,),

                ElevatedButton(onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();



                  if(wt!= "" && ft != "" && inch != ""){
                    // BMI Calculation

                    var iWt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var iInch = int.parse(inch);

                    var totalInch = (iFt * 12) + iInch;
                    var totalcenti = totalInch * 2.54;
                    var totalMeter = totalcenti / 100;

                    var Bmi = iWt/(totalMeter*totalMeter);
                    var msg = "";
                    if(Bmi>25){
                      msg = "You Are OverWeight";
                      bgColor = Colors.orange.shade200;
                    } else if(Bmi < 18) {
                      msg = "You Are underWeight";
                      bgColor = Colors.red.shade200;
                    } else {
                      msg = "You Are Healthy";
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "Your Bmi is ${Bmi.toStringAsFixed(2)}";
                    });
                  } else {
                    setState(() {
                      result = "Please fill all the required blanks!!";
                    });
                  }
                }, child: Text('Calculate')),
                SizedBox(height: 11,),
                Text(result, style: TextStyle(fontSize: 19),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
