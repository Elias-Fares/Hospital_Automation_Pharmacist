import 'package:flutter/material.dart';
import '../../function/date_format.dart';



class TextFieldDatePicker extends StatelessWidget {
  const TextFieldDatePicker({
    super.key,
    required this.textEditingController,
    this.validator,
    required this.hintText,
  });

  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: textEditingController,
        validator: validator,
        // borderStyleType: BorderStyleType.outlineInput,
        readOnly: true,
        onTap: () async {
          final DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime(2000),
            lastDate: DateTime(2050),
          );
          textEditingController?.text =
              selectedDate?.getYearMonthDay(commaShape: "/") ?? "";
        },
      ),
    );
  }
}

