import 'package:equatable/equatable.dart';

class CategoryOrBrandEntity extends Equatable {
  CategoryOrBrandEntity({
    this.results,
    this.data,
  });

  int? results;
  List<DataEntity>? data;

  @override
  // TODO: implement props
  List<Object?> get props => [results, data];
}

class DataEntity extends Equatable {
  DataEntity({
    this.id,
    this.name,
    this.slug,
    this.image,
  });

  String? id;
  String? name;
  String? slug;
  String? image;

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, slug, image];
}
