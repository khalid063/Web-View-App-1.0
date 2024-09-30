import 'package:flutter/material.dart';

import '../../../data/models/about_us_content_model.dart';
import '../../../data/models/network_response/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {

  ///========================================= All Variables ================================================================///

  ///--- API Call Variables ---///
  bool _getAboutUsContentInProgress = false;
  final List<AboutUsContentModel> _aboutUsContentList = [];


  ///========================================= API Call ======================================================================///
  AboutUsContentModel _aboutUsContentModel = AboutUsContentModel();
  Future<void> getAboutUsContent() async {
    _getAboutUsContentInProgress = true;

    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.aboutUsContent);

    print(response.statusCode);
    print(response.body);

    if (response.isSuccess) {
      _aboutUsContentModel = AboutUsContentModel.fromJson(response.body!);

      print("Title: ${_aboutUsContentModel.title}");
      print("Description: ${_aboutUsContentModel.description}");

      _aboutUsContentList.add(_aboutUsContentModel);  // Add the content model to the list

    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to retrieve About Us content!')),
        );
      }
    }

    _getAboutUsContentInProgress = false;

    if (mounted) {
      setState(() {});
    }
  }



  // AboutUsContentModel _aboutUsContentModel = AboutUsContentModel();
  // Future<void> getAboutUsContent() async{
  //   _getAboutUsContentInProgress = true;
  //   if (mounted) {
  //     setState(() {});
  //   }
  //   final NetworkResponse response = await NetworkCaller().getRequest(Urls.aboutUsContent);
  //   print(response.statusCode);
  //   print(response.body);
  //   if (response.isSuccess) {
  //     _aboutUsContentModel = AboutUsContentModel.fromJson(response.body!);
  //     print(_aboutUsContentModel.title);
  //     print(_aboutUsContentModel.description);
  //     // print(_aboutUsContentModel.data?.length);
  //     // print(_aboutUsContentModel.data?[0].phone);
  //
  //     aboutUsContent.addAll(_aboutUsContentModel. ?? []);
  //
  //     print(customerList[0].xtotaltarget);
  //
  //
  //   }else {
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Summary Data get Failede!'),),);
  //     }
  //   }
  //   _getCustomerListInProgress = false;
  //   if (mounted) {
  //     setState(() {});
  //   }
  // }



  ///========================================= InitState API Function Call ===================================================///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAboutUsContent();
    });
  }





  ///========================================= Scaffold Area =================================================================///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///------------------------------------- AppBar -------------------------------------------------------------------------///
      appBar: const CustomAppBar(title: 'Prachurjo',),

      ///------------------------------------- Drawer -------------------------------------------------------------------------///
      drawer: CustomDrawer(),

      ///------------------------------------- body ---------------------------------------------------------------------------///
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: Text(
              //'আমাদের সম্পর্কে',
              _aboutUsContentList.isNotEmpty
                  ? _aboutUsContentList[0].description ?? 'No description available'
                  : 'Loading...',


              //'drawar_menu_home'.tr,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                //color: _isHomeSelected ? Colors.white : Colors.blue, // Change text color based on isSelected
                color: AppColors.primaryColor, // Change text color based on isSelected
                fontFamily: 'Aikya',
              ),
            ),
          ),
        ),
      ),

    );
  }
}
