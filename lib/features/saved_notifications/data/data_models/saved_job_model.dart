class SavedJobModel {
  String? savedImg;
  String? jobName;
  String? compName;
  String? location;
  int? jobId;
  String? createDate;
  SavedJobModel(
      {required this.compName,
      required this.jobName,
      required this.location,
      required this.savedImg,
      });
  SavedJobModel.fromJson(Map jobDetails) {
    savedImg = jobDetails['jobs']['image'];
    jobName = jobDetails['jobs']['name'];
    compName = jobDetails['jobs']['comp_name'];
    location = jobDetails['jobs']['location'];
    jobId = jobDetails['jobs']["id"];
    createDate = jobDetails['jobs']['created_at'];
  }
}
