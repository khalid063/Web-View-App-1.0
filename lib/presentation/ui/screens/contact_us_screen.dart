import 'package:flutter/material.dart';

import '../../../data/models/contact_us_content_model.dart';
import '../../../data/models/network_response/network_response.dart';
import '../../../data/services/network_caller.dart';
import '../../../data/utils/urls.dart';
import '../utils/app_colors.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/custom_drawer.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {

  ///=========================================  All Variables =================================================================///

  ///--- API Call Variables ---///
  bool _getContactUsContentInProgress = false;
  final List<ContactUsContentModel> _contactUsContentList = [];

  ///========================================= API Call ======================================================================///
  ContactUsContentModel _contactUsContentModel = ContactUsContentModel();
  Future<void> getContactUsContent() async {
    _getContactUsContentInProgress = true;

    if (mounted) {
      setState(() {});
    }

    final NetworkResponse response = await NetworkCaller().getRequest(Urls.contactUsContent);

    print(response.statusCode);
    print(response.body);

    if (response.isSuccess) {
      _contactUsContentModel = ContactUsContentModel.fromJson(response.body!);

      print("Title: ${_contactUsContentModel.title}");
      print("Description: ${_contactUsContentModel.description}");

      _contactUsContentList.add(_contactUsContentModel);  // Add the content model to the list

    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to retrieve About Us content!')),
        );
      }
    }

    _getContactUsContentInProgress  = false;

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
      getContactUsContent();
    });
  }





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
            //'যোগাযোগ',
            //'drawar_menu_home'.tr,

            _contactUsContentList.isNotEmpty
                ? _contactUsContentList[0].description ?? 'No description available'
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
