class Source {
  final String? id;
  final String? name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data.addAll({'id': id});
    data.addAll({'name': name});

    return data;
  }
}
