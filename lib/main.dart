import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController leftEditingController = TextEditingController();
  TextEditingController rightEditingController = TextEditingController();
  int answer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Demo Home Page',
          style: TextStyle(
              color: Color(0xffeeeeee), fontSize: 20),),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 50, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextField(
                    controller: leftEditingController,
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(height: 20, width: 30,),
                Expanded(
                  child: TextField(
                    controller: rightEditingController,
                    decoration: const InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
                const SizedBox(height: 20, width: 30,
                ),
                Text('結果：' + '$answer', style: TextStyle( fontSize: 18, color: Color(0xff222222),),),
                const SizedBox(height: 20, width: 30,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, top: 50, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = int.parse(leftEditingController.text) + int.parse(rightEditingController.text);
                    });
                  },
                  child: const Text('+', style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                        answer = int.parse(leftEditingController.text) - int.parse(rightEditingController.text);
                    });
                  },
                  child: const Text('-', style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = int.parse(leftEditingController.text) * int.parse(rightEditingController.text);
                    });
                  },
                  child: const Text('×', style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      answer = int.parse(leftEditingController.text) ~/ int.parse(rightEditingController.text);
                    });
                  },
                  child: const Text('÷', style: TextStyle(color: Colors.white),),
                  style: ButtonStyle(
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
