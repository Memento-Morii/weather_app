class UtilsHelpers {
  ///Concatenate Strings with space
  static String concatenateString(List<String> strings) {
    var data = "";
    for (var str in strings) {
      data += "$str ";
    }

    return data.trimRight();
  }
}
