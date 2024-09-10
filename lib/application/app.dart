import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../presentation/ui/screens/splash_screen.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prachurja',
      ///--- *** for Bind with GetX controller ---///
      //initialBinding:  ControllerBinding(),
      ///--- Home Screen Call ---///
      home:  SplashScreen(),
    );
  }
}


//*** for Bind with GetX controller
class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    // Get.put<AboutUsContentController>(AboutUsContentController());
    // Get.put<ContactUsContentController>(ContactUsContentController());
    // Get.put<RelatedHadithContentController>(RelatedHadithContentController());
    // Get.put<PrayerTimesContentController>(PrayerTimesContentController());
    //Get.put<LoginController>(LoginController());
    // Get.put<StateListController>(StateListController());
    // Get.put<ZoneListController>(ZoneListController());
    // Get.put<AreaListController>(AreaListController());
    // Get.put<PaymentListController>(PaymentListController());
  }

}
