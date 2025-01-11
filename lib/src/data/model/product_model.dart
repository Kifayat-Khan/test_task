import 'package:test_task/src/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    super.id,
    super.title,
    super.description,
    super.category,
    super.price,
    super.discountPercentage,
    super.rating,
    super.stock,
    super.tags,
    super.brand,
    super.sku,
    super.weight,
    super.dimensions,
    super.warrantyInformation,
    super.shippingInformation,
    super.availabilityStatus,
    super.reviews,
    super.returnPolicy,
    super.minimumOrderQuantity,
    super.meta,
    super.images,
    super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      category: json['category'],
      price: (json['price'] as num?)?.toDouble(),
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: json['stock'],
      tags: (json['tags'] as List?)?.map((e) => e as String).toList(),
      brand: json['brand'],
      sku: json['sku'],
      weight: (json['weight'] as num?)?.toDouble(),
      dimensions: json['dimensions'] != null
          ? Dimensions(
              width: (json['dimensions']['width'] as num?)?.toDouble(),
              height: (json['dimensions']['height'] as num?)?.toDouble(),
              depth: (json['dimensions']['depth'] as num?)?.toDouble(),
            )
          : null,
      warrantyInformation: json['warrantyInformation'],
      shippingInformation: json['shippingInformation'],
      availabilityStatus: json['availabilityStatus'],
      reviews: (json['reviews'] as List?)
          ?.map((e) => Review(
                rating: (e['rating'] as num?)?.toDouble(),
                comment: e['comment'],
                date: e['date'],
                reviewerName: e['reviewerName'],
                reviewerEmail: e['reviewerEmail'],
              ))
          .toList(),
      returnPolicy: json['returnPolicy'],
      minimumOrderQuantity: json['minimumOrderQuantity'],
      meta: json['meta'] != null
          ? Meta(
              createdAt: json['meta']['createdAt'],
              updatedAt: json['meta']['updatedAt'],
              barcode: json['meta']['barcode'],
              qrCode: json['meta']['qrCode'],
            )
          : null,
      images: (json['images'] as List?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'price': price,
      'discountPercentage': discountPercentage,
      'rating': rating,
      'stock': stock,
      'tags': tags,
      'brand': brand,
      'sku': sku,
      'weight': weight,
      'dimensions': dimensions != null
          ? {
              'width': dimensions!.width,
              'height': dimensions!.height,
              'depth': dimensions!.depth,
            }
          : null,
      'warrantyInformation': warrantyInformation,
      'shippingInformation': shippingInformation,
      'availabilityStatus': availabilityStatus,
      'reviews': reviews
          ?.map((e) => {
                'rating': e.rating,
                'comment': e.comment,
                'date': e.date,
                'reviewerName': e.reviewerName,
                'reviewerEmail': e.reviewerEmail,
              })
          .toList(),
      'returnPolicy': returnPolicy,
      'minimumOrderQuantity': minimumOrderQuantity,
      'meta': meta != null
          ? {
              'createdAt': meta!.createdAt,
              'updatedAt': meta!.updatedAt,
              'barcode': meta!.barcode,
              'qrCode': meta!.qrCode,
            }
          : null,
      'images': images,
      'thumbnail': thumbnail,
    };
  }

  static List<ProductModel> jsonListToClassList(
      List<Map<String, dynamic>> jsonList) {
    return jsonList.map((json) => ProductModel.fromJson(json)).toList();
  }

  static List<Map<String, dynamic>> classListToJsonList(
      List<ProductModel> classList) {
    return classList.map((product) => product.toJson()).toList();
  }

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    List<String>? tags,
    String? brand,
    String? sku,
    double? weight,
    Dimensions? dimensions,
    String? warrantyInformation,
    String? shippingInformation,
    String? availabilityStatus,
    List<Review>? reviews,
    String? returnPolicy,
    int? minimumOrderQuantity,
    Meta? meta,
    List<String>? images,
    String? thumbnail,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      tags: tags ?? this.tags,
      brand: brand ?? this.brand,
      sku: sku ?? this.sku,
      weight: weight ?? this.weight,
      dimensions: dimensions ?? this.dimensions,
      warrantyInformation: warrantyInformation ?? this.warrantyInformation,
      shippingInformation: shippingInformation ?? this.shippingInformation,
      availabilityStatus: availabilityStatus ?? this.availabilityStatus,
      reviews: reviews ?? this.reviews,
      returnPolicy: returnPolicy ?? this.returnPolicy,
      minimumOrderQuantity: minimumOrderQuantity ?? this.minimumOrderQuantity,
      meta: meta ?? this.meta,
      images: images ?? this.images,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }
}
