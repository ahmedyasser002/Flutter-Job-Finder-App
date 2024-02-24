class SuggestedJobModel {
  String? jobName;
  String? compName;
  String? location;
  String? imageUrl;
  String? compWebsite;
  String? jobType;
  String? jobTimeType;
  String salary = '';
  int? jobID;
  String? jobDesc;
  String? jobSkill;
  String? compEmail;
  String? aboutComp;
  SuggestedJobModel(
      {required this.jobName,
      required this.compName,
      required this.compWebsite,
      required this.imageUrl,
      required this.jobTimeType,
      required this.jobType,
      required this.location,
      required this.salary,
      this.jobID});

  SuggestedJobModel.fromJson(Map jobDetails) {
    jobName = jobDetails["name"];
    jobType = jobDetails["job_type"];
    compName = jobDetails["comp_name"];
    imageUrl = jobDetails["image"];
    location = jobDetails["location"];
    salary = jobDetails["salary"];
    jobTimeType = jobDetails["job_time_type"];
    jobID = jobDetails['id'];
    jobDesc = jobDetails['job_description'];
    jobSkill = jobDetails['job_skill'];
    compWebsite = jobDetails['comp_website'];
    compEmail = jobDetails['comp_email'];
    aboutComp = jobDetails['about_comp'];
  }
}
