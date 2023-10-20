class Article_model {
  final String? title;
  final String? subtitle;
  final String? image;
  Article_model(
      {required this.title, required this.subtitle, required this.image});

  factory Article_model.fromJson(json) {
    return Article_model(
        title: json['title'],
        subtitle: json['description'],
        image: json['urlToImage']);
  }
}
