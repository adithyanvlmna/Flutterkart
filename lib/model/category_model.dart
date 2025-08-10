class CategoryModel {
  final int categoryId;
  final String categoryName;
  final String? categoryImage;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    this.categoryImage,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      categoryId: json['category_id'] ?? 0,
      categoryName: json['category_name'] ?? '',
      categoryImage: json['category_image']??"",
    );
  }
}
