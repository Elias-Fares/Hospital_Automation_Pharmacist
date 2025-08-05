import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/cards/icon_key_value_widget.dart';
import 'package:medicare_pharmacy/features/dispense_medicines/view/dispense_medicines_screen.dart';
part 'widget/search_text_field.dart';

class DispenseScreen extends ConsumerStatefulWidget {
  const DispenseScreen({super.key});
  static const routeName = "/dispense_screen";

  @override
  ConsumerState<DispenseScreen> createState() => _DispenseScreenState();
}

class _DispenseScreenState extends ConsumerState<DispenseScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SearchTextField(
            searchTextEditingController: searchTextEditingController,
          ),
          SizedBox(height: 20),

          ListView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:
                (context, index) => PrescriptionCard(
                  doctorName: "Lorem Ipsum",
                  medicinesCount: "2",
                  prescriptionCode: "123 456",
                  prescriptionDate: "10/11/2020",
                  onMedicinesTap: () {
                    context.push(DispenseMedicinesScreen.routeName);
                  },
                ),
          ),
        ],
      ),
    );
  }
}

class PrescriptionCard extends StatelessWidget {
  const PrescriptionCard({
    super.key,
    required this.doctorName,
    required this.medicinesCount,
    required this.prescriptionCode,
    required this.prescriptionDate,
    this.onDoctorTap,
    this.onMedicinesTap,
  });
  final String doctorName;
  final String medicinesCount;
  final String prescriptionCode;
  final String prescriptionDate;
  final void Function()? onDoctorTap;
  final void Function()? onMedicinesTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: [
          IconKeyValueWidget(
            keyTitle: "Doctor",
            value: doctorName,
            iconData: Icons.person_4_outlined,
            needOnTap: true,
            onTap: onDoctorTap,
          ),
          SizedBox(height: 20),
          IconKeyValueWidget(
            keyTitle: "Medicines",
            value: "$medicinesCount Medicines",
            iconData: Icons.medication_outlined,
            needOnTap: true,
            onTap: onMedicinesTap,
          ),
          SizedBox(height: 20),
          IconKeyValueWidget(
            keyTitle: "Code",
            value: prescriptionCode,
            iconData: Icons.qr_code_rounded,
          ),
          SizedBox(height: 20),
          IconKeyValueWidget(
            keyTitle: "Date",
            value: prescriptionDate,
            iconData: Icons.date_range,
          ),
        ],
      ),
    );
  }
}
