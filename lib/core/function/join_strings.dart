String joinStrings(List<String?> strings, {String joinChart = " "}) {
  return strings
      .whereType<String>() 
      .where((s) => s.trim().isNotEmpty)
      .join(joinChart);
}
