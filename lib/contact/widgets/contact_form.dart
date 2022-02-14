import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web/contact/bloc/contact_bloc.dart';
import 'package:portfolio_web/contact/widgets/contact_textfield.dart';
import 'package:portfolio_web/contact/widgets/submit_button.dart';

class ContactForm extends StatelessWidget {
  const ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              ContactTextField(
                title: 'Name',
                hint: 'Your Name',
              ),
              ContactTextField(
                title: 'Email',
                hint: 'Your Email',
              ),
              ContactTextField(
                title: 'Message',
                hint: 'Your Message',
              ),
              SizedBox(height: 10),
              SubmitButton(),
            ],
          ),
        );
      },
    );
  }
}
