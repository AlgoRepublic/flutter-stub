import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../src/utils/global_constants.dart';
import '../../../widgets/button_widget.dart';
import '../../../widgets/input_field_widget.dart';
import '../../../widgets/social_button_widget.dart';
import '../../login/view/login_view.dart';

class SignupView extends StatelessWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: hMargin, vertical: vMargin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Image.asset(
                  "assets/primary_logo.png",
                  width: Get.width * 0.4,
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text("Sign Up Now",
                    style: Theme.of(context).textTheme.headline1),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text("Please fill the details to create an account",
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                const InputFieldWidget(
                  hint: "Full Name",
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const InputFieldWidget(
                  hint: "Email",
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const InputFieldWidget(
                  hint: "Password",
                  obscure: true,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Password should be 6 character long",
                      style: Theme.of(context).textTheme.bodyText2),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                const ButtonWidget(text: "Signup"),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: "Already have an account? ",
                          style: Theme.of(context).textTheme.bodyText1),
                      TextSpan(
                          text: 'Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.to(() => const LoginView()),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Theme.of(context).primaryColor)),
                    ],
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                Text("Or connect with",
                    style: Theme.of(context).textTheme.bodyText1),
                SizedBox(
                  height: Get.height * 0.02,
                ),
                const SocialButtonWidget(
                  iconPath: "assets/google_icon.png",
                  text: "Login wih Gmail",
                ),
                const SizedBox(
                  height: 12,
                ),
                const SocialButtonWidget(
                  iconPath: "assets/apple_icon.png",
                  text: "Login wih Apple",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
