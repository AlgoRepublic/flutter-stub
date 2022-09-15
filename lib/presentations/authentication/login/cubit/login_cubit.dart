import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginWithGoogle() async {
    try {
      emit(ProcessingState());
      final GoogleSignIn googleSignIn =
          GoogleSignIn(scopes: ['http://mail.google.com/']);
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }
      await googleSignIn.signIn();

      if (await googleSignIn.isSignedIn()) {
        final auth = await googleSignIn.currentUser!.authentication;
        // print("---------------_Token");
        if (kDebugMode) {
          print(auth.accessToken);
        }

        // var response = await authService.socialAuth(
        // _googleSignIn.currentUser.id,
        // _googleSignIn.currentUser.email,
        // _googleSignIn.currentUser.displayName,
        // "google",
        // );
        // return response;
        emit(AlertMsgState(msg: "Login Successful", isForError: false));
      } else {
        emit(AlertMsgState(msg: "Please try again later", isForError: true));
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(AlertMsgState(msg: e.toString(), isForError: true));
    }
  }
}
