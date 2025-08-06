// ignore_for_file: file_names

class CategoriesModel {
  final String categoriesId;
  final String categoryImg;
  final String categoryName;
  final dynamic createdAt;
  final dynamic updatedAt;

  CategoriesModel({
    required this.categoriesId,
    required this.categoryImg,
    required this.categoryName,
    required this.createdAt,
    required this.updatedAt,
  });

  // Serialize the UserModel instance to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'categoriesId': categoriesId,
      'categoryImg': categoryImg,
      'categoryName': categoryName,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Create a UserModel instance from a JSON map
  factory CategoriesModel.fromMap(Map<String, dynamic> json) {
    return CategoriesModel(
      categoriesId: json['categoriesId'],
      categoryImg: json['categoryImg'],
      categoryName: json['categoryName'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
