class ApiModel {
  int? id;
  String? name;
  bool? featured;
  String? sku;
  String? priceType;
  List<Categories>? categories;
  Attributes? attributes;
  String? weight;
  String? dimensions;
  Images? images;
  String? productType;
  List<Variations>? variations;

  ApiModel(
      {this.id,
      this.name,
      this.featured,
      this.sku,
      this.priceType,
      this.categories,
      this.attributes,
      this.weight,
      this.dimensions,
      this.images,
      this.productType,
      this.variations});

  ApiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    featured = json['featured'];
    sku = json['sku'];
    priceType = json['price_type'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }

    attributes = json['attributes'] != null
        ? new Attributes.fromJson(json['attributes'])
        : null;
    weight = json['weight'];
    dimensions = json['dimensions'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
    productType = json['product_type'];
    if (json['variations'] != null) {
      variations = <Variations>[];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['featured'] = this.featured;
    data['sku'] = this.sku;
    data['price_type'] = this.priceType;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }

    if (this.attributes != null) {
      data['attributes'] = this.attributes!.toJson();
    }
    data['weight'] = this.weight;
    data['dimensions'] = this.dimensions;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    data['product_type'] = this.productType;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;

  Categories({this.id, this.name});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class Attributes {
  String? paKosherCertification;
  String? paBrand;
  String? paCaseQuantity;
  String? paPackSize;
  String? paApproximateCaseWeight;
  String? paSingleOrCase;

  Attributes(
      {this.paKosherCertification,
      this.paBrand,
      this.paCaseQuantity,
      this.paPackSize,
      this.paApproximateCaseWeight,
      this.paSingleOrCase});

  Attributes.fromJson(Map<String, dynamic> json) {
    paKosherCertification = json['pa_kosher-certification'];
    paBrand = json['pa_brand'];
    paCaseQuantity = json['pa_case-quantity'];
    paPackSize = json['pa_pack-size'];
    paApproximateCaseWeight = json['pa_approximate-case-weight'];
    paSingleOrCase = json['pa_single-or-case'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pa_kosher-certification'] = this.paKosherCertification;
    data['pa_brand'] = this.paBrand;
    data['pa_case-quantity'] = this.paCaseQuantity;
    data['pa_pack-size'] = this.paPackSize;
    data['pa_approximate-case-weight'] = this.paApproximateCaseWeight;
    data['pa_single-or-case'] = this.paSingleOrCase;
    return data;
  }
}

class Images {
  int? id;
  String? src;

  Images({this.id, this.src});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    src = json['src'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['src'] = this.src;
    return data;
  }
}

class Variations {
  int? id;
  String? name;
  int? stockQuantity;
  String? stockStatus;
  String? price;
  String? regularPrice;
  String? salePrice;
  bool? isWishlist;
  bool? isCart;
  String? cartId;
  int? cartQuantity;

  Variations(
      {this.id,
      this.name,
      this.stockQuantity,
      this.stockStatus,
      this.price,
      this.regularPrice,
      this.salePrice,
      this.isWishlist,
      this.isCart,
      this.cartId,
      this.cartQuantity});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stockQuantity = json['stock_quantity'];
    stockStatus = json['stock_status'];
    price = json['price'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    isWishlist = json['is_wishlist'];
    isCart = json['is_cart'];
    cartId = json['cart_id'];
    cartQuantity = json['cart_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['stock_quantity'] = this.stockQuantity;
    data['stock_status'] = this.stockStatus;
    data['price'] = this.price;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['is_wishlist'] = this.isWishlist;
    data['is_cart'] = this.isCart;
    data['cart_id'] = this.cartId;
    data['cart_quantity'] = this.cartQuantity;
    return data;
  }
}
