import 'package:employeedetails_learning/employee_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _buildText('LoginScreen', 18, null),
          titleSpacing: 3,
          centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Form(
              key: _formkey,
              child: Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(3, 2),
                          blurRadius: 7,
                          blurStyle: BlurStyle.outer,
                          color: Colors.grey,
                          spreadRadius: BorderSide.strokeAlignOutside)
                    ]),
                child: Column(
                  children: [
                    _buildText('Login', 16, 3),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _buildText('Name', 16, null),
                              _buildText('*', 16, null),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          _buildTextFormField(nameController, 'Enter your name',
                              _nameValidator())
                        ],
                      ),
                    ),
                    Container(
                      width: 250,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              _buildText('Password', 16, null),
                              _buildText('*', 16, null),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          _buildTextFormField(passwordController,
                              'Enter your passwor', _passwordvalidation())
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (_formkey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Employeelist(),
                                  ));
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            minimumSize: Size(250, 50)),
                        child: _buildText('login', 18, null))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildText(text, fontSize, letterspacing) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: letterspacing),
    );
  }

  _buildTextFormField(controller, hintText, validator) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      style: GoogleFonts.poppins(fontSize: 16),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          constraints: BoxConstraints.tight(Size.fromHeight(60)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: validator,
    );
  }

  _passwordvalidation() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Enter your password correctly';
      } else if (value.contains(RegExp(r'[A-Za-z!@#$%^&*()_+|]'))) {
        return '*Enter numerics only';
      }
      return null;
    };
  }

  _nameValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Enter your name correctly';
      } else if (value.contains(RegExp(r'[0-9]'))) {
        return '*Enter alphabets only';
      }
      return null;
    };
  }
}
