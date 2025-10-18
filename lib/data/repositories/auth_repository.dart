import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class AuthRepository {
   static String verId = "";
   static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  
  
   static Future<void> verifyPhoneNumber(BuildContext context, String phoneNumber) async {
     await _firebaseAuth.verifyPhoneNumber(
       phoneNumber: phoneNumber,
       verificationCompleted: (PhoneAuthCredential credential) async {
         await _firebaseAuth.signInWithCredential(credential);
       },
       verificationFailed: (FirebaseAuthException e) {
         if (e.code == 'invalid-phone-number') {
           print('The provided phone number is not valid.');
         }
       },
       codeSent: (String verificationId, int? resendToken) {
         verId = verificationId;
         print('Code sent to $phoneNumber');

         context.pushNamed('otp-screen', extra: verificationId);
         
       },
       codeAutoRetrievalTimeout: (String verificationId) {},
     );
   }



  static Future logout(BuildContext context) async {
    await _firebaseAuth.signOut();
    context.goNamed('login-screen');
  }



   static void submitOtp(BuildContext context, String otp) async {
      SignInWithPhone(context, verId, otp);
   }

   static Future<void> SignInWithPhone(BuildContext context, String verificationId,  String otp) async {
     try {
       PhoneAuthCredential credential = PhoneAuthProvider.credential(
         verificationId: verificationId,
         smsCode: otp,
       );

       final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
       
       print('User signed in: ${userCredential.user?.phoneNumber}');
       print('Successfully signed in with phone number.');

       context.goNamed('home-screen');
     } catch (e) {
       print('Failed to sign in: $e');
     }
   }
}



