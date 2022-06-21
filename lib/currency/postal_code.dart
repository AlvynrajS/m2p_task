class PostalCode {
  String? format;
  String? regex;

  PostalCode({this.format, this.regex});

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json['format'] as String?,
        regex: json['regex'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'format': format,
        'regex': regex,
      };
}
