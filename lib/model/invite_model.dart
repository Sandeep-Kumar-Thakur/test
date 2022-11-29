class InviteModel {
  String? errorFlag;
  String? message;

  InviteModel({this.errorFlag, this.message});

  InviteModel.fromJson(Map<String, dynamic> json) {
    errorFlag = json['error_flag'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error_flag'] = this.errorFlag;
    data['message'] = this.message;
    return data;
  }
}
