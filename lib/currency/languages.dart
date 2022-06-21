class Languages {
  String? deu;

  Languages({this.deu});

  factory Languages.fromJson(Map<String, dynamic> json) => Languages(
        deu: json['deu'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'deu': deu,
      };
}
