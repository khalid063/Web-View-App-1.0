class Urls {
  Urls._();

  //static const String _baseurl = 'http://103.231.177.98/api/v1'; // old or 1st url
  ///---------- Base Url ----------///
  //static const String _baseurl = 'http://202.164.208.181/api/v1';
  //static const String _baseurl = 'https://azan.ashshura.com';
  // https://prachurja.com/api/page/app-about-us
  static const String _baseurl = 'https://prachurja.com';

  ///---------- Login API --------///
  //static String login = '$_baseurl/account/login/';

  ///---------- About Us Content API --------///
  //static String aboutUsContent = '$_baseurl/about-us.json';
  static String aboutUsContent = '$_baseurl/api/page/app-about-us';


  //https://prachurja.com/api/page/apps-why-use-prachurja
  static String whyUsePrachurjaContent = '$_baseurl/api/page/apps-why-use-prachurja';
  //https://prachurja.com/api/page/apps-contact-us
  static String contactUsContent = '$_baseurl/api/page/apps-contact-us';

  ///---------- Contact Us API --------///
  //static String login = '$_baseurl/account/login/';
  //static String contactUsContent = '$_baseurl/contact-us.json';

  ///---------- Related Hadith API --------///
  //static String login = '$_baseurl/account/login/';
  static String relatedHadithContent = '$_baseurl/related-hadiths.json';

  ///---------- Prayer Times API --------///
  //static String login = '$_baseurl/account/login/';
  static String prayerTimesContent = '$_baseurl/prayer-times.json';

  ///---------- Customer List ---///
  // static String customerList = '$_baseurl/customer/list';
  // static String customerListNew = '$_baseurl/customer/list-new';


}