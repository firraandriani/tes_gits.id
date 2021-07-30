import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Soal Nomor 4';

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
  var inputan = '';
  var answer = '';

  void submit() {
    setState(() {
      answer = inputan.split('').reversed.join('');
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
              keyboardType: TextInputType.text,
              decoration: new InputDecoration(
                hintText: "Masukan Kalimat atau Kata",
                labelText: "Inputan",
                border: OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
              ),
              onChanged: (value) {
                setState(() {
                  inputan = value;
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
