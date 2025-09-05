import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/enums/batch_status.dart';
import 'package:medicare_pharmacy/core/function/date_format.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/no_data_widget.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/textfields/text_field_date_picker.dart';
import 'package:medicare_pharmacy/data/models/medicine_batch_model.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/features/batches/view_model/batches_view_model.dart';
part 'widget/batch_header.dart';
part 'widget/batch_row.dart';
part 'widget/batches_columns_titles.dart';
part 'widget/add_batch_dialog.dart';

class BatchesScreen extends ConsumerStatefulWidget {
  const BatchesScreen({
    super.key,
    required this.medicineId,
    required this.pharmacyMedicineId,
    // required this.batches,
  });
  static const routeName = "/batches_screen";
  final int? medicineId;
  final int? pharmacyMedicineId;

  @override
  ConsumerState<BatchesScreen> createState() => _BatchesScreenState();
}

class _BatchesScreenState extends ConsumerState<BatchesScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(batchesViewModelProvider.notifier)
          .getMedicineBatches(
            pharmacyMedicineId: widget.pharmacyMedicineId?.toString() ?? "",
          );
    });
  }

  @override
  Widget build(BuildContext context) {
    final batchesState = ref.watch(batchesViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            // SizedBox(height: 10),
            BatchesHeader(
              onAddTap: () {
                AddBatchDialog.builder(
                  context,
                  medicineId: widget.medicineId,
                  pharmacyMedicineId: widget.pharmacyMedicineId,
                );
              },
            ),

            SizedBox(height: 12),

            Flexible(
              child:
                  batchesState.getBatchesResponse?.when(
                    data: (batches) {
                      if (batches.medicineBatches?.isEmpty ?? true) {
                        return NoDataWidget(message: "No batches available");
                      }
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BatchesColumnsTitles(),
                          Expanded(
                            child: ListView.builder(
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: batches.medicineBatches?.length ?? 0,

                              itemBuilder: (context, index) {
                                final batch = batches.medicineBatches?[index];
                                return BatchRow(
                                  state: ref
                                      .read(batchesViewModelProvider.notifier)
                                      .getBatchStatus(
                                        batchDate: batch?.expiredDate,
                                      ),
                                  expirationDate:
                                      batch?.expiredDate?.getYearMonthDay() ??
                                      "",
                                  remainingQuantity:
                                      batch?.quantity?.toString() ?? "",
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                    error: (error, stackTrace) {
                      return CustomErrorWidget(
                        message: error.toString(),
                        onTryAgainTap: () {
                          ref
                              .read(batchesViewModelProvider.notifier)
                              .getMedicineBatches(
                                pharmacyMedicineId:
                                    widget.pharmacyMedicineId?.toString() ?? "",
                              );
                        },
                      );
                    },
                    loading: () => CustomLoadingWidget(),
                  ) ??
                  SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
