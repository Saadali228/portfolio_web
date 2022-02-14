import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        fixedSize: MaterialStateProperty.all<Size>(
          const Size(200, 45),
        ),
      ),
      child: const Text(
        'Send Message',
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      onPressed: () {},
    );
  }
}
