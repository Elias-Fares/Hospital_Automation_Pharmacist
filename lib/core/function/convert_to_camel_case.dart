String camelCase(String text) {
  if (text.isEmpty) {
    return '';
  }

  List<String> words = text.toLowerCase().split('_');
  String result = '';

  for (int i = 0; i < words.length; i++) {
    String word = words[i];
    if (word.isNotEmpty) {
      result += word[0].toUpperCase() + word.substring(1);
    }
  }

  return result;
}
