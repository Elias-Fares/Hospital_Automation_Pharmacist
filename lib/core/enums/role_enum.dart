enum RoleEnum { trainer, trainee }

extension RoleEnumExtension on RoleEnum {
  String getValue() {
    switch (this) {
      case RoleEnum.trainee:
        return "trainee";
      case RoleEnum.trainer:
        return "trainer";
    }
  }
}
