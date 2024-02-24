// import 'dart:io';

class PortfolioModel {
  int? id;
  String? cvFile;
  String? name;
  String? imgName;

  PortfolioModel(
      {required this.id,
      required this.cvFile,
      required this.name,
      required this.imgName});

  PortfolioModel.fromJson(Map portfolios) {
    id = portfolios['id'];
    cvFile = portfolios['cv_file'];
    imgName = portfolios['image'].toString().split('/').last;
    name = portfolios['name'];
  }
}
