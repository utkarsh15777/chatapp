import 'package:chatapp/services/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/mytextfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  final void Function()? onTap;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  RegisterPage({super.key, required this.onTap});

  void register(BuildContext context){
    final AuthService authService = AuthService();
    if(passwordController.text == confirmPasswordController.text){
        try{
          authService.signUpWithEmailAndPassword(emailController.text, passwordController.text);
          
        }catch (e){
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                e.toString()
              ),
            ),
          );
        }
    }else{
      showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                "Password and Confirm Password don't match"
              ),
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(
              height: 50,
            ),

            Text(
              "Let's create an account for you !",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16
              ),
            ),

            const SizedBox(
              height: 25,
            ),

            MyTextField(
              hintText: "Email",
              obscureText: false,
              textEditingController: emailController,
            ),

            const SizedBox(
              height: 10,
            ),

            MyTextField(
              hintText: "Password",
              obscureText: true,
              textEditingController: passwordController,
            ),

            const SizedBox(
              height: 10,
            ),

            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              textEditingController: confirmPasswordController,
            ),

            const SizedBox(
              height: 25,
            ),

            MyButton(
              text: "Register",
              onTap: () => register(context),
            ),

            const SizedBox(
              height: 20,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),

                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    " Login Now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}