import 'package:employeedetails_learning/components/colors.dart';
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
      appBar: _buildAppBar(),
      body: _buildBodyWidget(),
    );
  }

  _buildAppBar() {
    return AppBar(
        title: _buildText('LoginScreen',
            GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: 24)),
        centerTitle: true);
  }

  _buildBodyWidget() {
    return Center(
      child: Form(
        key: _formkey,
        child: Container(
          height: 350,
          width: 300,
          decoration: _buildBoxDecoration(),
          child: Column(
            children: [
              _buildText(
                  'Login',
                  GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 3)),
              const Divider(
                thickness: 2,
              ),
              _buildSizedBox(height: 12),
              _buildNameContainer(),
              _buildPasswordContainer(),
              _buildSizedBox(height: 18),
              _buildElevatedButton()
            ],
          ),
        ),
      ),
    );
  }

  _buildSizedBox({double? width, double? height}) {
    return SizedBox(width: width, height: height);
  }

  _buildElevatedButton() {
    return ElevatedButton(
        onPressed: () {
          setState(() {
            if (_formkey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Employeelist(),
                  ));
              nameController.clear();
              passwordController.clear();
            }
          });
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent, minimumSize: Size(250, 50)),
        child: _buildText(
            'login',
            GoogleFonts.poppins(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Colors.white)));
  }

  _buildNameContainer() {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildText(
                  'Name',
                  GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 16)),
              _buildText(
                  '*',
                  GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: redColor)),
            ],
          ),
          _buildSizedBox(height: 8),
          _buildTextFormField(
              nameController, 'Enter your name', _nameValidator(), false)
        ],
      ),
    );
  }

  _buildPasswordContainer() {
    return Container(
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildText(
                  'Password',
                  GoogleFonts.poppins(
                      fontWeight: FontWeight.w400, fontSize: 16)),
              _buildText(
                  '*',
                  GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: redColor)),
            ],
          ),
          _buildSizedBox(height: 8),
          _buildTextFormField(passwordController, 'Enter your password',
              _passwordvalidation(), true)
        ],
      ),
    );
  }

  _buildBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
              offset: Offset(3, 2),
              blurRadius: 7,
              blurStyle: BlurStyle.outer,
              color: Colors.grey,
              spreadRadius: BorderSide.strokeAlignOutside)
        ]);
  }

  Widget _buildText(String text, TextStyle style) {
    return Text(
      text,
      style: style,
    );
  }

  Widget _buildTextFormField(controller, hintText, validator, obscureText) {
    return Container(
      height: 60,
      child: TextFormField(
        obscureText: obscureText,
        controller: controller,
        style: GoogleFonts.poppins(fontSize: 16),
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            hintText: hintText,
            constraints: BoxConstraints.tight(const Size.fromHeight(60)),

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        validator: validator,
      ),
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
