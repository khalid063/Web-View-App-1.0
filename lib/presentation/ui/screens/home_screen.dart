

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}



class _HomeScreenState extends State<HomeScreen> {

  ///====================================================== All Variables =====================================================================///

  bool _isUrlLoding = true;


  ///====================================================== Web View Related variables, and Functions =========================================///
  late final WebViewController _controller;
  var url = 'https://www.prothomalo.com/';
  WebViewController controller = WebViewController();
  double loadingProgress = 0;


  //bool shouldPop = true;
  Future<bool> _onBackButtonPress() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  // WebViewController controller = WebViewController()
  //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //   ..setNavigationDelegate(
  //     NavigationDelegate(
  //       onProgress: (int progress) {
  //         // Update loading bar.
  //       },
  //       onPageStarted: (String url) {},
  //       onPageFinished: (String url) {},
  //       onHttpError: (HttpResponseError error) {},
  //       onWebResourceError: (WebResourceError error) {},
  //       onNavigationRequest: (NavigationRequest request) {
  //         if (request.url.startsWith('https://www.youtube.com/')) {
  //           return NavigationDecision.prevent;
  //         }
  //         return NavigationDecision.navigate;
  //       },
  //     ),
  //   )
  //   ..loadRequest(Uri.parse('https://prachurja.com'));


  ///============================================================ initState =======================================================///

  // @override
  // void initState() {
  //   super.initState();
  //   controller = WebViewController()
  //     ..setJavaScriptMode(JavaScriptMode.unrestricted)
  //     ..setNavigationDelegate(
  //       NavigationDelegate(
  //         onProgress: (int progress) {
  //           setState(() {
  //             loadingProgress = progress / 50;
  //           });
  //         },
  //         onPageStarted: (String url) {
  //           // Optionally show a loading indicator
  //           print('Page started loading: $url');
  //         },
  //         onPageFinished: (String url) {
  //           // Optionally hide loading indicator
  //           print('Page finished loading: $url');
  //         },
  //         // onHttpError: (HttpResponseError error) {
  //         //   // Handle HTTP errors
  //         //   print('HTTP error: ${error.description}');
  //         // },
  //         onWebResourceError: (WebResourceError error) {
  //           // Handle web resource errors
  //           print('Web resource error: ${error.description}');
  //         },
  //         onNavigationRequest: (NavigationRequest request) {
  //           if (request.url.startsWith('https://prachurja.com')) {
  //             // Prevent navigation to the specified URL
  //             print('Navigation to ${request.url} prevented.');
  //             return NavigationDecision.prevent;
  //           }
  //           return NavigationDecision.navigate;
  //         },
  //       ),
  //     )
  //     ..loadRequest(Uri.parse('https://prachurja.com'));
  // }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //_isUrlLoding = false;
    print('test 001 : $_isUrlLoding');

    ///--- Controller for Web View Call ---///
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

      _isUrlLoding = true;
    print('test 002 : $_isUrlLoding');

  }




  ///============================================================ Scaffold Area ====================================================///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text(
      //     'Prachurjo',
      // ),),
      ///------------------------------------- AppBar -------------------------------------------------------------------------///
      appBar: const CustomAppBar(title: 'Prachurjo',),

      ///------------------------------------- Drawer -------------------------------------------------------------------------///
      drawer: CustomDrawer(),

      body: SafeArea(
        //child: _isUrlLoding ? const Center(child: CircularProgressIndicator(strokeWidth: 0.5)) : WebViewWidget(controller: controller),
        child: WebViewWidget(controller: controller),
      ),

      // body: Stack(
      //   children: [
      //     WebViewWidget(controller: controller),
      //     if (loadingProgress < 1.0)
      //       LinearProgressIndicator(value: loadingProgress),
      //   ],
      // ),

      //body: SafeArea(child: WebViewWidget(controller: controller),),


      // body: _screens[_currentIndex],
      //
      // bottomNavigationBar: Card(
      //   elevation: 6,
      //   margin: const EdgeInsets.all(16.0),
      //   child: SalomonBottomBar(
      //     duration: Duration(seconds: 1),
      //     items: _items,
      //     currentIndex: _currentIndex,
      //     onTap: (index) => setState(() {
      //       _currentIndex = index;
      //     }),
      //   ),
      // ),



    );

    // return WillPopScope(
    //   onWillPop: _onBackButtonPress,
    //   child: Scaffold(
    //       drawer: NavBar(),
    //       appBar: AppBar(
    //         title: Text('Go Together'),
    //         centerTitle: true,
    //       ),
    //       body: WebView(
    //         initialUrl: 'https://flutter.dev',
    //         javascriptMode: JavascriptMode.unrestricted,
    //         onWebViewCreated: (WebViewController webViewController) {
    //           _controller = webViewController;
    //         },
    //       )
    //     ),
    // );





  }
}
