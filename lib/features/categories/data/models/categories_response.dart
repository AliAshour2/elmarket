class CategoriesListResponse {
  int? results;
  Metadata? metadata;
  List<CategoryResponse>? data;

  CategoriesListResponse({this.results, this.metadata, this.data});

  CategoriesListResponse.fromJson(Map<String, dynamic> json) {
    if (json['results'] is int) {
      results = json['results'];
    }
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = <CategoryResponse>[];
      json['data'].forEach((v) {
        data!.add(CategoryResponse.fromJson(v));
      });
    }
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}

class CategoryResponse {
  String? id;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryResponse(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
}
