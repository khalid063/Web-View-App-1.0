import 'package:flutter/material.dart';

import '../../../data/models/network_response/network_response.dart';
import '../../../data/models/why_use_prachurja_content_model.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class WhyThisAppScreen extends StatefulWidget {
  const WhyThisAppScreen({super.key});

  @override
  State<WhyThisAppScreen> createState() => _WhyThisAppScreenState();
}

class _WhyThisAppScreenState extends State<WhyThisAppScreen> {

  ///=========================================  All Variables =================================================================///

  ///--- API Call Variables ---///
  bool _getAboutUsContentInProgress = false;
  final List<WhyUsePrachurjaContentModel> _whyUsePrachurjaContentList = [];

  ///========================================= API Call ======================================================================///
  WhyUsePrachurjaContentModel _whyUsePrachurjaContentModel = WhyUsePrachurjaContentModel();
  Future<void> getWhyUsePrachurjaContent() async {
    _getAboutUsContentInProgress = true;

    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.whyUsePrachurjaContent);

    print(response.statusCode);
    print(response.body);

    if (response.isSuccess) {
      _whyUsePrachurjaContentModel = WhyUsePrachurjaContentModel.fromJson(response.body!);

      print("Title: ${_whyUsePrachurjaContentModel.title}");
      print("Description: ${_whyUsePrachurjaContentModel.description}");

      _whyUsePrachurjaContentList.add(_whyUsePrachurjaContentModel);  // Add the content model to the list

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


  ///========================================= InitState API Function Call ===================================================///
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getWhyUsePrachurjaContent();
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
        child: Center(
          child: Text(
            //'কেন এই অ্যাপ ?',
            //'drawar_menu_home'.tr,

            _whyUsePrachurjaContentList.isNotEmpty
                ? _whyUsePrachurjaContentList[0].description ?? 'No description available'
                : 'Loading...',


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

    );
  }
}
