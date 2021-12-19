import 'package:flutter/material.dart';

class RegistrationScreenWidget extends StatefulWidget {
  const RegistrationScreenWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationScreenWidget> createState() => _RegistrationScreenWidgetState();
}

class _RegistrationScreenWidgetState extends State<RegistrationScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REGISTRATION"),
      ),
      body: Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/');
            },
            child: Text("go to main")
          )
      )
    );
  }
}