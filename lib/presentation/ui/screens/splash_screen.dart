import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../main.dart';
import '../utils/app_colors.dart';
import '../utils/image_assets.dart';
import 'home_screen.dart';
import '../widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ///======================================== All Variables ================================================================================///
  AppColors appColors = AppColors();   // Instance of App Color
  WebViewController controller = WebViewController();

  ///======================================== "init" State Call ============================================================================///
  ///======================================== "init" State Call ============================================================================///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://youtube.com')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://prachurja.com'));

    navigateToLogin();   /// Function Call "Start" Splash Screen 5 Second delay code
  }

  ///======================================== Function write area ==========================================================================///

  ///---------- Function for Check login or not ----------///
  Future<void> navigateToLogin() async {
    Future.delayed(const Duration(seconds: 5)).then((_) async {
      //final bool isLoggedIn = await AuthUtility.checkIfUserLoggedIn();
      if (mounted) {

        /// use Get X for "Navigation" work
        // Get.offAll(
        //       () => isLoggedIn ? const HomeScreen() : const LoginScreen(),
        // );

        Get.offAll(
              () => const HomeScreen(),
        );

      }
    });

  }

  ///---------- old Login code of Flash Screen----------///
  // void navigateToLogin() {
  //   Future.delayed( const Duration(seconds: 6)).then((_) {
  //     Navigator.pushAndRemoveUntil(
  //         context,
  //         MaterialPageRoute(builder: (context) => const LoginScreen()),
  //             (route) => false);
  //     //Get.offAll(const LoginScreen());
  //   });
  // }

  ///======================================== Scaffold Area ================================================================================///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          //color: appColors.color[50],
          color: AppColors.primaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                ///---------- Logo Animation --------------///
                AvatarGlow(
                  glowColor: Colors.blue,
                  endRadius: 90.0,
                  duration: const Duration(milliseconds: 2000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: const Duration(milliseconds: 100),
                  child: Material(     // Replace this child with your own
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    child: CircleAvatar(
                      //backgroundColor: Colors.grey[100],
                      backgroundColor: Colors.white,
                      radius: 40.0,
                      child: Image.asset(
                        ImageAssets.imageNewLogoPNG,
                        height: 60,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                /// ---------- Loader Animation ----------///
                const SpinKitCircle(
                  color: Colors.orange,
                  size: 50.0,
                  // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                ),
                const SizedBox(height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
