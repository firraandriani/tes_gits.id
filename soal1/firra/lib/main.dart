import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Soal Nomor 1",
    home: SoalPertama(),
  ));
}

class SoalPertama extends StatefulWidget {
  @override
  _SoalPertamaState createState() => _SoalPertamaState();
}

class _SoalPertamaState extends State<SoalPertama> {
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Soal Nomor 1"),
      ),
      body: Form(
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
      ),
    );
  }
}
