class UserModel {

  int? id;
  String? uid;
  String? email;
  String? firstName;
  String? lastName;
  String? streetAddress;
  String? city;
  String? zip;
  String? citizenship;


  UserModel(
      {this.id,
      this.uid,
      this.email,
      this.firstName,
      this.lastName,
      this.streetAddress,
      this.city,
      this.zip,
      this.citizenship});

  UserModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.uid = json['uid'];
      this.email = json['email'];
      this.firstName = json['firstName'];
      this.lastName = json['lastName'];
      this.streetAddress = json['streetAddress'];
      this.city = json['city'];
      this.zip = json['zip'];
      this.citizenship = json['citizenship'];
  }

  // Map<String, dynamic> toJson() => {'id':id, 'name':name };
}