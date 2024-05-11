// ignore_for_file: public_member_api_docs

class CategoryModel {
  CategoryModel({required this.name, required this.id});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': final int id,
        'name': final String categoryName,
      } =>
        CategoryModel(name: categoryName, id: id),
      (_) => throw const FormatException('Unable to deserialize data'),
    };
  }
  final int id;
  final String name;
}
