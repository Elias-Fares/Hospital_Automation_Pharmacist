import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/extra_keys.dart';

import 'package:medicare_pharmacy/core/widgets/cards/icon_title_navigation_button.dart';
import 'package:medicare_pharmacy/core/widgets/floating_action_button_with_faded_elevation.dart';
import 'package:medicare_pharmacy/features/alternative_medicines/view/alternative_medicines_screen.dart';
import 'package:medicare_pharmacy/features/batches/view/batches_screen.dart';
import 'package:medicare_pharmacy/features/edit_medicine/view/edit_medicine_screen.dart';

import 'package:medicare_pharmacy/features/specify_sale_amount/view/specify_sale_amount_screen.dart';
import '../../../configuration/res.dart';
import '../../../core/constant/constant.dart';
import '../../../data/models/medicine_model.dart';
import '../../../core/style/app_colors.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/cards/icon_key_value_widget.dart';
import '../../../core/widgets/general_network_image.dart';

part 'widget/medicine_details_navigation_section.dart';
part 'widget/medicine_details_widget.dart';

class MedicineDetailsScreen extends ConsumerStatefulWidget {
  const MedicineDetailsScreen({super.key, this.med});
  static const routeName = "/medicine_details_screen";

  final MedicineModel? med;

  @override
  ConsumerState<MedicineDetailsScreen> createState() =>
      _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends ConsumerState<MedicineDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SubAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButtonFadedElevation(
      //   title: "Sell",
      //   onTap: () {
      //     context.push(SpecifySaleAmountScreen.routeName);
      //   },
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            MedicineDetailsWidget(
              name: widget.med?.name ?? "",
              price:
                  "${widget.med?.price?.toString() ?? ""} ${Constant.appCurrency}",
              imageUrl: "${Constant.baseUrl}/${widget.med?.medImageUrl ?? ""}",
              // imageUrl: "${Constant.baseUrl}/${widget.med?.medImageUrl ?? ""}",
              titer: widget.med?.pharmaceuticalTiter?.toString() ?? "",
              composition: widget.med?.pharmaceuticalComposition ?? "",
              indication: widget.med?.pharmaceuticalIndications ?? "",
              company: widget.med?.companyName ?? "",
              lowBound:
                  widget.med?.pharmacyMedicines?.first.lowbound?.toString() ??
                  "",
              allownace:
                  widget.med?.isAllowedWithoutPrescription! == true
                      ? "Prescription not required"
                      : "Prescription required",

              batchesCount:
                  widget
                      .med
                      ?.pharmacyMedicines
                      ?.firstOrNull
                      ?.medicineBatches
                      ?.length ??
                  0,

              onBatchesTap: () {
                context.push(
                  BatchesScreen.routeName,

                  extra: {
                    ExtraKeys.pharmacyMedicineId: widget.med?.pharmacyMedicines?.first.pharmacyMedicineId,
                    ExtraKeys.medId: widget.med?.medicinesId,
                    
                    // ExtraKeys.batches:
                    //     widget
                    //         .med
                    //         ?.pharmacyMedicines
                    //         ?.firstOrNull
                    //         ?.medicineBatches,
                  },
                );
              },
            ),

            SizedBox(height: 24),

            MedicineDetailsNavigationSection(
              onAddBatchTap: () {
                // context.push(
                //   BatchesScreen.routeName,

                //   extra: {
                //     ExtraKeys.medId: widget.med?.medicinesId,
                //     ExtraKeys.batches:
                //         widget
                //             .med
                //             ?.pharmacyMedicines
                //             ?.firstOrNull
                //             ?.medicineBatches,
                //   },
                // );
              },
              onAlternativeTap: () {
                context.push(
                  AlternativeMedicinesScreen.routeName,
                  extra: widget.med?.medicinesId?.toString() ?? "",
                );
              },
              onDeleteMedTap: () {},
              onEditMedicineDetailsTap: () {
                context.push(EditMedicineScreen.routeName, extra: widget.med);
              },
            ),

            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
