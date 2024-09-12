import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:web_view_app/presentation/ui/utils/app_colors.dart';
import '../screens/home_screen.dart';
import '../utils/image_assets.dart';


class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {


  ///--- selected Value ---///
  bool _isHomeSelected = false;
  bool _isSettingsSelected = false;
  bool _isAboutUsSelected = false;
  bool _isCommunicationSelected = false;
  bool _isWhyThisAppSelected = false;
  bool _isAllProjectsSelected = false;

  ///======================================== BackButton Function ==========================================================///
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

  ///======================================== Drawer part =================================================================///
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      width: 220,
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(30),
              child: Material(
                elevation: 8.0,
                shape: const CircleBorder(),
                child: CircleAvatar(
                  //backgroundColor: Colors.grey[100],
                  backgroundColor: Colors.white,
                  //backgroundColor: Colors.red,
                  radius: 40.0,
                  child: Image.asset(
                    //ImageAssets.bulkcorLogoPNG,
                    ImageAssets.logoOfSplashScreenPNG,
                    height: 30,
                  ),
                ),
              ),
            ),
            ///---------------------------------------- হোম -------------------------------------------------------------///
            ListTile(
              leading: SvgPicture.asset(ImageAssets.homeIcon03SVG, width: 23,),
              //leading: Icon(Icons.home),
              //title: const Text('হোম'),

              title: const Text(
                'হোম ',
                //'drawar_menu_home'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  //color: _isHomeSelected ? Colors.white : Colors.blue, // Change text color based on isSelected
                  color: AppColors.primaryColor, // Change text color based on isSelected
                  fontFamily: 'Aikya',
                ),
              ),

              onTap: () {
                print("Home 1 is Clicked");
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),),);
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- Add New Customer -------------------------------------------------///
            // ListTile(
            //   leading: SvgPicture.asset(ImageAssets.addCustomerIconSVG),
            //   title: const Text('Add Customer'),
            //   onTap: () {
            //     print("Customer List is Clicked");
            //     Navigator.push(context, MaterialPageRoute(builder: (context) => const AddNewCustomerScreen(),),);
            //     //Navigator.of(context).push(CustomRouteBuilder(MaterialPageRoute(builder: (context) => const CustomerListScreen(),),),);
            //   },
            // ),
            ///---------------------------------------- আমাদের সম্পর্কে ----------------------------------------------------///
            ListTile(
              //leading: SvgPicture.asset(ImageAssets.listIconSVG),
              leading: SvgPicture.asset(ImageAssets.aboutUsIconSVG, width: 23,),
              //leading: Icon(Icons.app_blocking_outlined),
              //title: const Text('Customer List'),

              title: const Text(
                'আমাদের সম্পর্কে',
                //'drawar_menu_home'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  //color: _isHomeSelected ? Colors.white : Colors.blue, // Change text color based on isSelected
                  color: AppColors.primaryColor, // Change text color based on isSelected
                  fontFamily: 'Aikya',
                ),
              ),

              onTap: () {
                print("Customer List is Clicked");
                //Get.to(CustomerListScreen());
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListScreen(),),);
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const CustomerListForAddCustomer(),),);
                //Navigator.of(context).push(CustomRouteBuilder(MaterialPageRoute(builder: (context) => const CustomerListScreen(),),),);
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- কেন এই অ্যাপ  --------------------------------------------------///
            ListTile(
              //leading: SvgPicture.asset(ImageAssets.orderIconSVG, width: 23,),
              leading: SvgPicture.asset(ImageAssets.whyIconSVG, width: 23,),
              //leading: Icon(Icons.account_circle_outlined),
              //leading: SvgPicture.asset(ImageAssets.whyThisAppIconSVG, width: 23,),

              //title: const Text('Order Placement'),
              title: const Text(
                'কেন এই অ্যাপ ?',
                //'drawar_menu_home'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  //color: _isHomeSelected ? Colors.white : Colors.blue, // Change text color based on isSelected
                  color: AppColors.primaryColor, // Change text color based on isSelected
                  fontFamily: 'Aikya',
                ),
              ),

              onTap: () {
                print("Order Placement");
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderCustomerListScreen(),),);
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- যোগাযোগ  --------------------------------------------------///
            ListTile(
              //leading: SvgPicture.asset(ImageAssets.passwordChangeIconBlackSVG, width: 23),
              leading: SvgPicture.asset(ImageAssets.contactUsIconSVG, width: 23),
              //leading: Icon(Icons.confirmation_num_outlined),
              //title: const Text('Password Change'),

              title: const Text(
                'যোগাযোগ ',
                //'drawar_menu_home'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  //color: _isHomeSelected ? Colors.white : Colors.blue, // Change text color based on isSelected
                  color: AppColors.primaryColor, // Change text color based on isSelected
                  fontFamily: 'Aikya',
                ),
              ),

              onTap: () {
                print("Password Change is Clicked");
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const PasswordChangeScreen(),),);
                // Add navigation or functionality for password change here
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
            ///---------------------------------------- লগ আউট  ----------------------------------------------------------///
            ListTile(
              //leading: SvgPicture.asset(ImageAssets.logoutIconSVG),
              leading: SvgPicture.asset(ImageAssets.logOutIcon04SVG, width: 23,),
              //leading: Icon(Icons.login),
              //title: const Text('Log Out'),

              title: const Text(
                'লগ আউট ',
                //'drawar_menu_home'.tr,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  //color: _isHomeSelected ? Colors.white : Colors.blue, // Change text color based on isSelected
                  color: AppColors.primaryColor, // Change text color based on isSelected
                  fontFamily: 'Aikya',
                ),
              ),

              onTap: () async {
                print("Log Out is Clicked");
                //await AuthUtility.clearUserInfo();
                if (mounted) {
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const LoginScreen()),
                  //       (route) => false,
                  // );
                }
                // Add functionality for logging out here
              },
            ),
            Divider(
              height: 5,
              color: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }
}
