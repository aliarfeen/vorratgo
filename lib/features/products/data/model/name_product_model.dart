class Name {
  final String en;
  final String ar;

  Name({required this.en, required this.ar});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(en: json['en'] ?? '', ar: json['ar'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'en': en, 'ar': ar};
  }
}
