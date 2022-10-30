import 'package:flutter/material.dart';
import 'package:sqfliteq/sqflite.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final textcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SqlDb _sqlDp = SqlDb();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Sqflite'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 80, right: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: textcontroller,
              ),
              ElevatedButton(
                onPressed: () async {
                  String respone = await _sqlDp.insertData(
                      "INSERT INTO 'notes' ('note') VALUES ('${textcontroller.text}')");
                  print(respone);
                },
                child: const Text('insert'),
              ),
              ElevatedButton(
                onPressed: () async {
                  List<Map> respone =
                      await _sqlDp.readData("SELECT * FROM 'notes'");
                  print(respone);
                },
                child: const Text('read'),
              ),
              ElevatedButton(
                onPressed: () async {
                  int respone = await _sqlDp
                      .deleteData("DELETE FROM 'notes' WHERE id = 4");
                },
                child: const Text('delet'),
              ),
              ElevatedButton(
                onPressed: () async {
                  int respone = await _sqlDp.updateData(
                      "UPDATE 'notes' SET 'note' = 'Gx' WHERE id =  3");
                },
                child: const Text('updata'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
