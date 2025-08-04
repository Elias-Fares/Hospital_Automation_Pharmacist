enum GenderEnum { male, female }

extension GenderEnumExtension on GenderEnum {
  String getTitle() {
    if (this == GenderEnum.male) {
      return "male";
    } else {
      return "female";
    }
  }
}
