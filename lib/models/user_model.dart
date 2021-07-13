class UserModel {

  int? id;
  String? uid;
  String? name;
  String? email;

  UserModel({ this.id, this.name });

  UserModel.fromJson(Map<String, dynamic> json){
      this.id = json['id'];
      this.uid = json['uid'];
      this.name = json['name'];
      this.email = json['email'];
  }

  Map<String, dynamic> toJson() => {'id':id, 'name':name };
}