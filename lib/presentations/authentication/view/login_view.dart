import 'package:base_project/presentations/authentication/cubit/authentication_cubit_cubit.dart';
import 'package:base_project/presentations/authentication/view/signup_view.dart';
import 'package:base_project/presentations/home/home_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../src/utils/global_constants.dart';
import '../../../src/utils/utils.dart';
import '../../widgets/button_widget.dart';
import '../../widgets/input_field_widget.dart';
import '../../widgets/social_button_widget.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AlertMessageState) {
            Utils.showSnackBar(
              state.msg,
              state.isForError ? SnackBarType.error : SnackBarType.success,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: ModalProgressHUD(
              inAsyncCall: state is ProcessingState,
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
                      Text("Log in Now",
                          style: Theme.of(context).textTheme.headline1),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Text("Please Login to Continue Using Our App",
                          style: Theme.of(context).textTheme.bodyText1),
                      SizedBox(
                        height: Get.height * 0.04,
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
                        alignment: Alignment.centerRight,
                        child: Text("Forget Password?",
                            style: Theme.of(context).textTheme.bodyText2),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      InkWell(
                          onTap: () {
                            Get.to(() => HomeView());
                          },
                          child: const ButtonWidget(text: "Login")),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: "Don't have an account? ",
                                style: Theme.of(context).textTheme.bodyText1),
                            TextSpan(
                                text: 'Sign up',
                                recognizer: TapGestureRecognizer()
                                  ..onTap =
                                      () => Get.to(() => const SignupView()),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        color: Theme.of(context).primaryColor)),
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
                      InkWell(
                        onTap: () {
                          BlocProvider.of<AuthenticationCubit>(context)
                              .loginWithGoogle();
                        },
                        child: const SocialButtonWidget(
                          iconPath: "assets/google_icon.png",
                          text: "Login wih Gmail",
                        ),
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
        },
      ),
    );
  }
}
