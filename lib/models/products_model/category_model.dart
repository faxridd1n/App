import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CategoryModel {
  final int id;
  final String name;
  final String imageId;
  final bool isVisible;

  const CategoryModel({
    this.id = -1,
    this.name = '',
    this.imageId = '',
    this.isVisible = false,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

class CategoryConverter implements JsonConverter<CategoryModel, Map<String, dynamic>> {
  const CategoryConverter();

  @override
  CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel.fromJson(json);

  @override
  Map<String, dynamic> toJson(CategoryModel object) => {};
}
