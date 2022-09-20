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
import '../cubit/authentication_cubit_cubit.dart';
import 'login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  ///
  ///
  ///
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ///
  ///
  ///
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
          } else if (state is AuthSuccessState) {
            Get.offAll(const HomeView());
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AuthLoadingState,
            child: SafeArea(
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
                        "assets/ar.png",
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
                      InputFieldWidget(
                        hint: "Full Name",
                        controller: nameController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      InputFieldWidget(
                        hint: "Email",
                        controller: emailController,
                      ),
                      SizedBox(
                        height: Get.height * 0.02,
                      ),
                      InputFieldWidget(
                        hint: "Password",
                        controller: passwordController,
                        obscure: true,
                      ),
                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Password should be 6 character long",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      InkWell(
                          onTap: () {
                            BlocProvider.of<AuthenticationCubit>(context)
                                .signupWithEmail(
                              nameController.text,
                              emailController.text,
                              passwordController.text,
                            );
                          },
                          child: const ButtonWidget(
                            text: "Signup",
                          )),
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
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
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
        },
      ),
    );
  }
}
