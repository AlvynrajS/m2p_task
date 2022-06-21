class Eng {
  String? f;
  String? m;

  Eng({this.f, this.m});

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json['f'] as String?,
        m: json['m'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'f': f,
        'm': m,
      };
}
