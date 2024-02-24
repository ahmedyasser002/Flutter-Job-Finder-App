class ProfileModel {
  int? id;
  String? name;
  String? email;
  // String? location;
  // int? jobId;
  // String? createDate;
  ProfileModel({
    required this.email,
    required this.name,
    // required this.location,
    required this.id,
  });
  ProfileModel.fromJson(Map profile) {
    id = profile['id'];
    name = profile['name'];
    email = profile['email'];
    // location = jobDetails['jobs']['location'];
    // jobId = jobDetails['jobs']["id"];
    // createDate = jobDetails['jobs']['created_at'];
  }
}
