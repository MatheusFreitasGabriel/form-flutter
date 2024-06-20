import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {

  final _formKey = GlobalKey<FormState>();

  Color neutra = Colors.blue;

  TextEditingController _controller = TextEditingController();

  String? _selectedToy;

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextFormField(
              controller: _controller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DropdownButtonFormField<String>(
              value: _selectedToy,
              items: [
                DropdownMenuItem(
                  value: 'Carrinho',
                  child: Text('Carrinho'),
                ),
                DropdownMenuItem(
                  value: 'Boneca',
                  child: Text('Boneca'),
                ),
                DropdownMenuItem(
                  value: 'Bola',
                  child: Text('Bola'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedToy = value;
                });
              },
              validator: (value) {
                if (value == null) {
                  return 'Selecione um brinquedo';
                }
                return null;
              },
              hint: Text('Escolha um brinquedo'),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: neutra,
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );

                  if(_controller.text == "freitas"){
                    setState(() {
                      neutra = Colors.green;
                    });
                  }else{
                    setState(() {
                      neutra = Colors.red;
                    });
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
