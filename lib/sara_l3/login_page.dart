import 'package:c3/sara_l3/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
//State managemnt
class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  final email = "sara@gmail.com";
  final password = "12345";

  bool isObscure = true;
  int counter =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Login page"),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "email should not be empty";
                  }
                  if (value != email) {
                    return "invalid email";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelText: "Enter email address",
                  hintText: "abc@gmail.com",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                obscureText: isObscure,
                validator: (value) {
                  if (value!.isEmpty) return "password should not be empty";
                  if (value != password) {
                    return "invalid password";
                  }

                  return null;
                },
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      isObscure = !isObscure;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.visibility,
                      color: isObscure ? Colors.blue : Colors.grey,
                    ),
                  ),
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  labelText: "Enter password",
                  hintText: "*****",
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Text('$counter'),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => ProfileSaraPage(),
                        ),
                        (route) => false,
                      );
                    }
                  },
                  child: Text(
                    "LogIn",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
