import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Soal Nomor 1';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  int bil1 = 0;
  var answer = '';

  void submit() {
    setState(() {
      if ((bil1 % 3 == 0) && (bil1 % 5 == 0)) {
        answer = 'Hello World';
      } else if (bil1 % 3 == 0) {
        answer = 'Hello';
      } else if (bil1 % 5 == 0) {
        answer = 'World';
      } else {
        answer = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Masukan Bilangan",
                labelText: "Bilangan",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                setState(() {
                  bil1 = int.parse(value);
                });
              },
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('$answer'),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: TextStyle(color: Colors.white)),
              onPressed: () {
                submit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
