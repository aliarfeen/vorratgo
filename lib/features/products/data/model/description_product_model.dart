class Description {
  final String en;
  final String ar;

  Description({required this.en, required this.ar});

  factory Description.fromJson(Map<String, dynamic> json) {
    return Description(en: json['en'] as String, ar: json['ar'] as String);
  }
  Map<String, dynamic> toJson() {
    return {'en': en, 'ar': ar};
  }
}
