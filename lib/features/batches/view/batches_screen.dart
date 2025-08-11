import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/function/date_format.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/no_data_widget.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/textfields/text_field_date_picker.dart';
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
    required this.batches,
  });
  static const routeName = "/batches_screen";
  final int? medicineId;
  final List<MedicineBatch>? batches;

  @override
  ConsumerState<BatchesScreen> createState() => _BatchesScreenState();
}

class _BatchesScreenState extends ConsumerState<BatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),

        child: Column(
          children: [
            // SizedBox(height: 10),
            BatchesHeader(
              onAddTap: () {
                AddBatchDialog.builder(context,medicineId: widget.medicineId);
              },
            ),

            SizedBox(height: 12),

            if (widget.batches?.isEmpty ?? true) ...[
              NoDataWidget(height: 200, message: "No Batches yet"),
            ] else ...[
              BatchesColumnsTitles(),

              ListView.builder(
                itemCount: widget.batches?.length ?? 0,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (context, index) {
                  final batch = widget.batches?.elementAtOrNull(index);

                  return BatchRow(
                    state: index == 1 ? "expired" : "safe",
                    expirationDate: batch?.expiredDate?.getYearMonthDay() ?? "",
                    remainingQuantity: batch?.quantity?.toString() ?? "",
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}

