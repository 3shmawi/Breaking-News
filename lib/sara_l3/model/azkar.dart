class Azkar {
  Azkar({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });
  late final String category;
  late final String count;
  late final String description;
  late final String reference;
  late final String content;

  Azkar.fromJson(Map<String, dynamic> json){
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    _data['count'] = count;
    _data['description'] = description;
    _data['reference'] = reference;
    _data['content'] = content;
    return _data;
  }
}