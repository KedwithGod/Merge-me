import 'package:mergeme/Model/constants/route_path.dart' as route;
class UserId{
  final String uid;
  UserId(this.uid);
}




class User {
  final String id;
  final String fullName;
  final String email;
  final String password;
  final String mobileNo;
  final String workNo;
  final String tradeName;
  final String nin;
  final String tutorOption;
  final String tradeCategory;
  final String specificTrade;
  final String location;

  User(
      this.password,
      this.mobileNo,
      this.workNo,
      this.tradeName,
      this.nin,
      this.tutorOption,
      this.tradeCategory,
      this.id,
      this.fullName,
      this.email,
     this.specificTrade, this.location);

  User.fromData(Map<String, dynamic> data)
      : id = data[route.UserID],
        fullName = data[route.Name],
        email = data[route.Email],
        password = data[route.Password],
        mobileNo = data[route.mobilePhone],
        workNo = data[route.workPhone],
        tradeName = data[route.trade],
        nin = data[route.NIN],
        tutorOption = data[route.tutorOption],
        tradeCategory = data[route.tradeCategory],
        specificTrade=data[route.specificTrade],
        location = data[route.Location];

  Map<String, dynamic> toJson() {
    return {
      route.UserID: id,
      route.Name: fullName,
      route.Email: email,
      route.Password:password,
      route.mobilePhone:mobileNo,
      route.workPhone:workNo,
      route.trade:tradeName,
      route.NIN:nin,
      route.tutorOption:tutorOption,
      route.tradeCategory:tradeCategory,
      route.specificTrade:specificTrade,
      route.Location:location
    };
  }
}

class UserLocation {
  final String locality;
  final String postalCode;
  final String country;
  final String subLocality;
  UserLocation({this.locality, this.postalCode, this.country,this.subLocality});


}
