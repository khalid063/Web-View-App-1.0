import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///------------------------------------- AppBar -------------------------------------------------------------------------///
      appBar: const CustomAppBar(title: 'Prachurjo',),

      ///------------------------------------- Drawer -------------------------------------------------------------------------///
      drawer: CustomDrawer(),

      ///------------------------------------- body ---------------------------------------------------------------------------///
      body: const SafeArea(
        child: Center(
          child: Text(
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
        ),
      ),

    );
  }
}
