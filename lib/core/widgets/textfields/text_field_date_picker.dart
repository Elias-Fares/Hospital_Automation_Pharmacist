import 'package:flutter/material.dart';
import '../../function/date_format.dart';

class TextFieldDatePicker extends StatelessWidget {
  const TextFieldDatePicker({
    super.key,
    required this.textEditingController,
    this.validator,
    required this.hintText,
    this.decoration,
    this.style,
  });

  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final String hintText;
  final InputDecoration? decoration;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        // borderStyleType: BorderStyleType.outlineInput,
        decoration: decoration,
        readOnly: true,
        style: style,
        onTap: () async {
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2050),
          );
          textEditingController?.text =
              selectedDate?.getYearMonthDay(commaShape: "-") ?? "";
        },
      ),
    );
  }
}
