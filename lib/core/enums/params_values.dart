enum ParamsValues {
  both,
  children,
  patient,
  upcomming,
  passed,
  missed,
  child,
  doctor,
  details,
  pharmacy,
  down,
  up,
  create,
  update,
  delete,
  

}

extension ParamsValuesExtension on ParamsValues {
  String get value {
    switch (this) {
      case ParamsValues.both:
        return 'both';
      case ParamsValues.children:
        return 'children';
      case ParamsValues.patient:
        return 'patient';
      case ParamsValues.upcomming:
        return 'upcomming';
      case ParamsValues.passed:
        return 'passed';
      case ParamsValues.child:
        return 'child';
      case ParamsValues.missed:
        return 'missed';
      case ParamsValues.doctor:
        return "doctor";
      case ParamsValues.details:
        return "details";
      case ParamsValues.pharmacy:
        return "pharmacy";
      case ParamsValues.down:
        return "down";
      case ParamsValues.up:
        return "up";
      case ParamsValues.create:
        return "create";
      case ParamsValues.update:
        return "update";
      case ParamsValues.delete:
        return "delete";
    }
  }
}
