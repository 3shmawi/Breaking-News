import 'package:flutter/material.dart';

class LoginScreen23 extends StatefulWidget {
  const LoginScreen23({Key? key}) : super(key: key);

  @override
  State<LoginScreen23> createState() => _LoginScreen23State();

  static void showSnackBarAsBottomSheet(BuildContext context, String message) {
    showModalBottomSheet<void>(
      isDismissible: false,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      context: context,
      barrierColor: const Color.fromRGBO(0, 0, 0, 0),
      builder: (BuildContext context) {
        return Container(
          height: 50,
          alignment: AlignmentDirectional.center,
          color: Colors.grey.shade800,
          padding: const EdgeInsets.all(12),
          child: Wrap(
            children: [
              Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _LoginScreen23State extends State<LoginScreen23> {
  final String password = '123456';

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String email) {
    // Regular expression for a simple email validation
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'It should not be empty';
                    }
                    if (!isValidEmail(value)) {
                      return "Invalid";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address...',
                    hintText: "abc@gmail.com",
                    hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.grey[500],
                        ),
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'It should not be empty';
                    }

                    if (value != password) {
                      return 'Invalid value';
                    }
                    if (value.length < 4) {
                      return "short length";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: 'Password...',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        LoginScreen23.showSnackBarAsBottomSheet(
                            context, 'Login Successfully');
                      }
                    },
                    child: const Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
