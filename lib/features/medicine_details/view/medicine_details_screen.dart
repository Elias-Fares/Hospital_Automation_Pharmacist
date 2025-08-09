import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
              allownace:
                  widget.med?.isAllowedWithoutPrescription! == true
                      ? "Prescription not required"
                      : "Prescription required",

              // TODO add batch count
              batchesCount: 2,

              onBatchesTap: () {},
            ),

            SizedBox(height: 24),

            MedicineDetailsNavigationSection(
              onAddBatchTap: () {
                context.push(BatchesScreen.routeName);
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

class MedicineDetailsNavigationSection extends StatelessWidget {
  const MedicineDetailsNavigationSection({
    super.key,
    required this.onEditMedicineDetailsTap,
    required this.onAlternativeTap,
    required this.onAddBatchTap,
    required this.onDeleteMedTap,
  });

  final void Function() onEditMedicineDetailsTap;
  final void Function() onAlternativeTap;
  final void Function() onAddBatchTap;
  final void Function() onDeleteMedTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          IconTitleNavigationButton(
            iconPath: Res.drawerMedicineIcon,
            title: "Edit medicine details",
            onTap: onEditMedicineDetailsTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.batchIcon,
            title: "Medicine batches",
            onTap: onAddBatchTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.alternativeIcon,
            title: "Alternatives",
            onTap: onAlternativeTap,
          ),
          IconTitleNavigationButton(
            iconPath: Res.trashIcon,
            title: "Delete medicine",
            onTap: onEditMedicineDetailsTap,
            textColor: AppColors.error,
          ),
        ],
      ),
    );
  }
}

class MedicineDetailsWidget extends StatelessWidget {
  const MedicineDetailsWidget({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.titer,
    required this.composition,
    required this.indication,
    required this.company,
    required this.allownace,
    required this.batchesCount,
    this.onBatchesTap,
  });

  final String name;
  final String price;
  final String imageUrl;
  final String titer;
  final String composition;
  final String indication;
  final String company;
  final String allownace;

  final int batchesCount;
  final void Function()? onBatchesTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 16,
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GeneralNetworkImage(
              url: imageUrl,
              // url:
              //     "https://th.bing.com/th/id/R.dcd85fd802de08a660ef70274abd6549?rik=jEnBkxetovWJxA&pid=ImgRaw&r=0",
              width: MediaQuery.sizeOf(context).width,
              height: 380.h,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleMedium),
              Text(
                price,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Titer",
            value: titer,
            iconPath: Res.medicineTiter,
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Allownace",
            value: allownace,
            iconPath: Res.prescriptionsIcon,
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Company",
            value: company,
            iconPath: Res.medicineCompany,
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Batches",
            value: "$batchesCount total",
            iconPath: Res.batchIcon,
            onTap: onBatchesTap,
            needOnTap: true,
          ),

          const SizedBox(height: 16),
          Text(
            "Pharmaceutical composition",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Text(composition, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),
          Text(
            "Pharmaceutical Indication",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Text(indication, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
