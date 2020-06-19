class ResourceList {
  int count;
  String next;
  String previous;

  ResourceList.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        next = json['next'],
        previous = json['previous'];

  @override
  String toString() =>
      '${this.runtimeType} {count: $count, previous: $previous, next: $next}';
}
