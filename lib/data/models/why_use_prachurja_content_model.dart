class WhyUsePrachurjaContentModel {
  String? title;
  String? description;

  WhyUsePrachurjaContentModel({this.title, this.description});

  WhyUsePrachurjaContentModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}
