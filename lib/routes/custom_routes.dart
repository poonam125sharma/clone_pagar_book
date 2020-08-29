import 'package:pagar_book/routes/all_files_include.dart';

var customRoutes = {
  '/': (context) => SplashScreen(),
  '/choose-lang': (context) => ChooseLang(),
  '/get-number': (context) => GetPhoneNumber(),
  '/get-profile-business': (context) => GetProfileBusiness(),
  '/bsns-mnth-hrs-ques': (context) => MnthHrsQues(),
  '/dashboard': (context) => Dashboard()
};