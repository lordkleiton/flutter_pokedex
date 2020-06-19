class ApiResource {
  String url;

  ApiResource.fromJson(Map<String, dynamic> json) {
    this.url = json['url'];
  }

  @override
  String toString() => 'ApiResource {url: ${this.url}}';
}
