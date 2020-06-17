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

class PostJobDetails{
  final String jobType;
  final String location;
  final String budget;
  final String duration;
  final dynamic time;
  final dynamic date;
  final String jobDescription;
  final dynamic jobPosterId;
  final dynamic postJobFilePath;
  final dynamic noOfFilePosted;
  final dynamic jobStatus;
  final Map<dynamic,dynamic> postJobMultiplePaths;

  PostJobDetails(
      {this.jobPosterId, this.jobType, this.location, this.budget,
        this.duration,
      this.time,
      this.date,
      this.jobDescription,
      this.postJobFilePath,
      this.postJobMultiplePaths,this.noOfFilePosted,this.jobStatus});

  Map<String, dynamic> toJson() {
    return {
      route.JobPosterId: jobPosterId,
      route.JobType: jobType,
      route.JobPosterLocation: location,
      route.JobBudget:budget,
      route.JobDuration:duration,
      route.TimeJobWasPosted:time,
      route.DateJobWasPosted:date,
      route.JobDescription:jobDescription,
      route.PostJobFilePath:postJobFilePath,
      route.PostJobMultiplePaths:postJobMultiplePaths,
      route.LengthOfFileUploaded:noOfFilePosted,
      route.JobStatus:jobStatus
    };
  }

  PostJobDetails.fromData(Map<String, dynamic> data,String documentId)
      : jobPosterId = data[route.JobPosterId],
        jobType = data[route.JobType],
        location = data[route.JobPosterLocation],
        budget = data[route.JobBudget],
        duration= data[route.JobDuration],
        time = data[route.TimeJobWasPosted],
        date = data[route.DateJobWasPosted],
        jobDescription = data[route.JobDescription],
        postJobFilePath = data[route.PostJobFilePath],
        postJobMultiplePaths= data[route.PostJobMultiplePaths],
        noOfFilePosted=data[route.LengthOfFileUploaded],
        jobStatus=data[route.JobStatus]
        ;
}