abstract class QueryUtils {
  static String toQueryable(String query) => _sanitize(query);

  static int toId(String query) {
    try {
      return int.parse(toQueryable(query));
    } catch (e) {
      return null;
    }
  }

  static String _sanitize(String s) {
    final RegExp exp = new RegExp(r'^http');
    String result;

    if (exp.hasMatch(s)) {
      final List<String> aux = s.split('/');

      result = aux[aux.length - 2];
    } else {
      result = s;
    }

    return result;
  }
}
