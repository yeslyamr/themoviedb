import 'package:flutter/material.dart';

class EmailVerificationScreenWidget extends StatefulWidget {
  const EmailVerificationScreenWidget({Key? key}) : super(key: key);

  @override
  State<EmailVerificationScreenWidget> createState() => _EmailVerificationScreenWidgetState();
}

class _EmailVerificationScreenWidgetState extends State<EmailVerificationScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Email Ver"),
        ),
        body: Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: const Text('go to main')
            )
        )
    );
  }
}
