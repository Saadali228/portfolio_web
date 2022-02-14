import 'package:flutter/material.dart';

class ContactTextField extends StatelessWidget {
  const ContactTextField({
    Key? key,
    required this.title,
    required this.hint,
  }) : super(key: key);

  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: TextFormField(
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: hint,
                hintStyle: const TextStyle(
                    color: Color(0xff929292),
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xffC4C4C4),
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
