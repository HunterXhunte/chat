import 'package:auth_buttons/auth_buttons.dart';
import 'package:chat_try_3/blocs/chat%20bloc/chat%20cubit.dart';
import 'package:chat_try_3/screens/login%20screen.dart';
import 'package:chat_try_3/screens/users%20screen.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../widgets/text field widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    ChatCubit cubit = ChatCubit.get(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: h,
            color: first,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Register",
                  style: TextStyle(
                      color: forth, fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    secure: false,
                    controller: nameController,
                    suffixIcon: Icons.drive_file_rename_outline,
                    hintText: "Full Name",
                    keyBoardType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    secure: false,
                    controller: phoneController,
                    suffixIcon: Icons.phone_android,
                    hintText: "Phone",
                    keyBoardType: TextInputType.number),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    secure: false,
                    controller: emailController,
                    suffixIcon: Icons.email_outlined,
                    hintText: "Email",
                    keyBoardType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    secure: true,
                    controller: passwordController,
                    suffixIcon: Icons.lock,
                    hintText: "Password",
                    keyBoardType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      cubit.pickImage("cam");
                    },
                    child: Text("Choose Image")),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: w * .7,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.registerByEmailAndPassword(
                          emailController.text.trim(),
                          nameController.text,
                          passwordController.text);
                    },
                    child: Text("Register"),
                    style: ElevatedButton.styleFrom(
                      primary: forth,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: w * .7,
                  child: GoogleAuthButton(
                      onPressed: () async {
                        await cubit.signInByGoogle();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AllUsers(),
                            ));
                      },
                      //text:"SignIn with Google",

                      style: AuthButtonStyle(
                        textStyle: TextStyle(color: Colors.black54),
                        buttonType: AuthButtonType.secondary,
                        iconType: AuthIconType.secondary,
                        buttonColor: Colors.white,
                        borderRadius: 20,
                        iconSize: 15,
                        splashColor: Colors.white,
                      )),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("already have an account"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.black87),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
