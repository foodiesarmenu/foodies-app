/// _id : "65e457bce065fe1e88f6026a"
/// image : "https://images.unsplash.com/photo-1623689048105-a17b1e1936b8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2hpbmVzZSUyMGZvb2R8ZW58MHx8MHx8fDA%3D"
/// name : "Chinese"
/// description : "Chinese cuisine encompasses a vast array of regional styles and flavors, each boasting unique ingredients and cooking techniques. From the fiery spice of Szechuan dishes to the delicate sweetness of Cantonese dim sum, Chinese cuisine offers a vibrant and flavorful journey for every palate."

class Category {
  Category({
    this.id,
    this.image,
    this.name,
    this.description,
  });

  Category.fromJson(dynamic json) {
    id = json['_id'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  String? id;
  String? image;
  String? name;
  String? description;

  Category copyWith({
    String? id,
    String? image,
    String? name,
    String? description,
  }) =>
      Category(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['image'] = image;
    map['name'] = name;
    map['description'] = description;
    return map;
  }
}
