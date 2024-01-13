import 'package:flutter/material.dart';


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade700,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),

              decoration: BoxDecoration(
                color: Colors.white, // Set the background color here
                borderRadius: BorderRadius.circular(32.0), // Set the border radius here
              ),
              child: const TextField(
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                  obscureText: true,
                  decoration:
                  InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(32.0)),
                    ),
                  )
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
              decoration: BoxDecoration(
              color: Colors.white, // Set the background color here
              borderRadius: BorderRadius.circular(32.0), // Set the border radius here
            ),
              child: const TextField(
                style: TextStyle(color: Colors.black),
                textAlign: TextAlign.center,
                obscureText: true,
                decoration:
                InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(32.0)),
                  ),
                )
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            RoundButton(
              text: 'Log In',
              color: Colors.lightBlueAccent,
              childTextColor: Colors.white,
              onPressed: () async {

              },
            )
          ]),
    );
  }
}


class RoundButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  Color childTextColor;
  RoundButton({
    required this.text,
    required this.color,
    required this.childTextColor,
    required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
        child: Material(
          elevation: 5.0,
          color: color,

          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: null,
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              text,
              style: TextStyle(
                color: childTextColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
