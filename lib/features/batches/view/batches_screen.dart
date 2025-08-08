import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
part 'widget/batch_header.dart';
part 'widget/batch_row.dart';
part 'widget/batches_columns_titles.dart';
part 'widget/add_batch_dialog.dart';

class BatchesScreen extends ConsumerStatefulWidget {
  const BatchesScreen({super.key});
  static const routeName = "/batches_screen";

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
                AddBatchDialog.builder(context);
              },
            ),

            SizedBox(height: 12),

            BatchesColumnsTitles(),

            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => BatchRow(
                    state: index == 1 ? "expired" : "safe",
                    expirationDate: "20/07/2026",
                    remainingQuantity: "20",
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
