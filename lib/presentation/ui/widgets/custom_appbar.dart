import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/image_assets.dart';



class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _CustomAppBarState extends State<CustomAppBar> {

  /// ======================================== BackButton Function ============================///
  Future<bool> _onBackButtonPress() async {
    return (await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(child: Text('Are you sure?'),),
        //content: const Text('Do you want to exit'),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Adjust padding as needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () {

                    // Navigator.pushAndRemoveUntil(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const LoginScreen(),
                    //   ),
                    //       (route) => false,
                    // );

                    SystemNavigator.pop(); // This will close the app

                  },
                  child: const Text('Yes'),
                ),
              ],
            ),
          ),
        ],
      ),
    )) ?? false;
  }

  /// Old Code
  // Future<bool> _onBackButtonPress() async {
  //   return (await showDialog(
  //     context: context,
  //     builder: (context) => new AlertDialog(
  //       title: new Text('Are you sure?'),
  //       content: new Text('Do you want to exit an App'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: new Text('No'),
  //         ),
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(true),
  //           child: new Text('Yes'),
  //         ),
  //       ],
  //     ),
  //   )) ?? false;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 5),
        height: 50,
        color: Colors.white,
        child: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.white, fontSize: 22,),
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
                bottomLeft: Radius.circular(15.0),
              )
          ),
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          //backgroundColor: Colors.redAccent,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: SvgPicture.asset(ImageAssets.homeIcon02SVG),
                //icon: Icon(Icons.menu),
                iconSize: 25,
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () async {
                //await AuthUtility.clearUserInfo();
                if (mounted) {
                  _onBackButtonPress();
                }
              },
              //icon: Icon(Icons.login),
              //icon: Icon(SvgPicture.asset(ImageAssets.homeIconSVG)),
              icon: SvgPicture.asset(
                ImageAssets.logOutIcon02SVG,
                width: 24,  // Adjust the width as needed
                height: 24, // Adjust the height as needed
              ),
            ),
          ],
        ),
      ),
    );
  }
}
