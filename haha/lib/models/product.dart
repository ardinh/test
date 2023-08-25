import 'package:get/get.dart';
import 'package:haha/models/core_model.dart';
import 'package:flutter/material.dart';
import 'package:haha/modules/index/index_controller.dart';
import 'package:haha/shared/shared.dart';

class Product extends CoreModel {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discount;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<dynamic>? images;
  bool? favorite;

  Product(
      {this.id,
      this.title,
      this.description,
      this.price,
      this.discount,
      this.rating,
      this.stock,
      this.brand,
      this.category,
      this.thumbnail,
      this.images,
      this.favorite = false});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
      id: json['id'] ?? '',
      title: CustomUtil.getStringFromMap(json, 'title'),
      description: CustomUtil.getStringFromMap(json, 'description'),
      price: CustomUtil.getIntFromMap(json, 'price'),
      discount: CustomUtil.getDoubleFromMap(json, 'discountPercentage'),
      rating: CustomUtil.getDoubleFromMap(json, 'rating'),
      stock: CustomUtil.getIntFromMap(json, 'stock'),
      brand: CustomUtil.getStringFromMap(json, 'brand'),
      category: CustomUtil.getStringFromMap(json, 'category'),
      thumbnail: CustomUtil.getStringFromMap(json, 'thumbnail'),
      images: json['images'] ?? [],
      favorite: json['fav'] == "true");

  @override
  List<RowAction> getActions() {
    return [
      RowAction(
        id: "view",
        icon: StyleConstant.actionIcons['view'],
        color: ColorConstants.colorInfo,
      ),
    ];
  }

  @override
  Widget getListItem(BuildContext context) {
    IndexController ic = Get.find<IndexController>();
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return SizedBox(
      width: bodyWidth * 0.40,
      height: bodyHeight * 0.34,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(bodyWidth * 0.03)),
                      child: Hero(
                        tag: title!,
                        child: Image.network(
                          thumbnail!,
                          width: constraints.maxWidth * 1.00,
                          height: constraints.maxHeight * 0.71,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Positioned(
                        left: constraints.maxWidth / 1.32,
                        top: constraints.maxHeight / 1.59,
                        child: IconButton(
                          color: (favorite!)
                              ? const Color(0xFFDB3022)
                              : const Color(0xFF9B9B9B),
                          icon: (favorite!)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          onPressed: () async {
                            if (favorite!) {
                              await ic.updateData(false, id);
                            } else {
                              await ic.updateData(true, id);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Row(
                children: [
                  ...List.generate(
                    rating!.round(),
                    (index) => const Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF9B9B9B),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Text(
                brand ?? "",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 11,
                  color: Color(0xFF9B9B9B),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Text(
                title ?? "",
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: Color(0xFF222222),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.01,
              ),
              Text(
                '$price\$',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF222222),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getItem(BuildContext context) {
    IndexController ic = Get.find<IndexController>();
    final SizeConfig sizeConfig = SizeConfig();
    sizeConfig.init(context);
    final bodyWidth = sizeConfig.screenWidth;
    final bodyHeight = sizeConfig.screenHeight;
    return SizedBox(
      width: bodyWidth * 0.40,
      height: bodyHeight * 0.34,
      child: LayoutBuilder(
        builder: (_, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.all(Radius.circular(bodyWidth * 0.03)),
                      child: Hero(
                        tag: title!,
                        child: Image.network(
                          thumbnail!,
                          width: constraints.maxWidth * 1.00,
                          height: constraints.maxHeight * 0.71,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        width: constraints.maxWidth * 0.24,
                        height: constraints.maxHeight * 0.14,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF9B9B9B),
                              blurRadius: constraints.maxWidth * 0.001,
                              spreadRadius: constraints.maxWidth * 0.001,
                              offset: Offset(0, constraints.maxWidth * 0.005),
                            ),
                          ],
                        ),
                        child: IconButton(
                          color: (favorite!)
                              ? const Color(0xFFDB3022)
                              : const Color(0xFF9B9B9B),
                          icon: (favorite!)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border),
                          onPressed: () async {
                            if (favorite!) {
                              await ic.updateData(false, id);
                            } else {
                              await ic.updateData(true, id);
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Row(
                children: [
                  ...List.generate(
                    rating!.round(),
                    (index) => const Icon(
                      Icons.star_border_rounded,
                      color: Color(0xFF9B9B9B),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Text(
                "$category-$brand",
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFF9B9B9B),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.02,
              ),
              Text(
                title ?? "",
                maxLines: 1,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  color: Color(0xFF222222),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.01,
              ),
              Text(
                '$price\$',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF222222),
                ),
              ),
              Text(
                description ?? "",
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF222222),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Jumlah kolom dalam grid
                    crossAxisSpacing: 2, // Spasi antara kolom
                    mainAxisSpacing: 2, // Spasi antara baris
                  ),
                  itemCount: images!.length,
                  itemBuilder: (context, index) {
                    return Image.network(images![index]);
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
