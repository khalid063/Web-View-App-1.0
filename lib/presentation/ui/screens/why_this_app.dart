import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class WhyThisAppScreen extends StatefulWidget {
  const WhyThisAppScreen({super.key});

  @override
  State<WhyThisAppScreen> createState() => _WhyThisAppScreenState();
}

class _WhyThisAppScreenState extends State<WhyThisAppScreen> {
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
        ),
      ),

    );
  }
}
