class ApiResource {
  String url;

  ApiResource.fromJson(Map<String, dynamic> json) : url = json['url'];

  @override
  String toString() => '${this.runtimeType} {url: $url}';
}
