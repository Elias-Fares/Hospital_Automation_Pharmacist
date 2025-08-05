import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare_pharmacy/core/models/medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/app_bar_with_search.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/floating_action_button_with_faded_elevation.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/update_price/view_model/update_price_view_model.dart';
part 'widget/update_med_card.dart';
part 'widget/update_price_dialog.dart';
part 'widget/selected_med_chip.dart';

class UpdatePriceScreen extends ConsumerStatefulWidget {
  const UpdatePriceScreen({super.key});
  static const routeName = "/update_price_screen";

  @override
  ConsumerState<UpdatePriceScreen> createState() => _UpdatePriceScreenState();
}

class _UpdatePriceScreenState extends ConsumerState<UpdatePriceScreen> {
  final searchTextEditingController = TextEditingController();

  final jsonString = """ {
            "medicinesId": 3,
            "name": "nospa",
            "expiredAt": "2026-04-04T00:00:00.000Z",
            "pharmaceuticalTiter": 300,
            "pharmaceuticalIndications": "for stomachache",
            "pharmaceuticalComposition": "antispa 500 mg",
            "company_Name": "OPM",
            "price": 11000,
            "isAllowedWithoutPrescription": true,
            "barcode": "123457",
            "medImageUrl":  "https://tse4.mm.bing.net/th/id/OIP.E6GBbEWNpCzxm1XBVtUCcwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
            "createdAt": "2025-06-25T18:44:19.000Z",
            "updatedAt": "2025-06-25T18:44:19.000Z",
            "pharmacy_medicines": [
                {
                    "pharmacy_medicineId": 4,
                    "lowbound": 4,
                    "createdAt": "2025-06-25T18:54:35.000Z",
                    "updatedAt": "2025-06-25T18:54:35.000Z",
                    "medicine_id": 3,
                    "pharmacy_id": 1,
                    "medicine_batches": [
                        {
                            "medicine_batchId": 4,
                            "quantity": 15,
                            "expired_date": "2025-09-09",
                            "createdAt": "2025-06-25T18:54:35.000Z",
                            "updatedAt": "2025-06-25T18:54:35.000Z",
                            "pharmacy_medicine_id": 4
                        }
                    ]
                }
            ]
        }""";

  late MedicineModel fakeMedModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fakeMedModel = MedicineModel.fromJson(json.decode(jsonString));
  }

  @override
  Widget build(BuildContext context) {
    final updatePriceState = ref.watch(updatePriceViewModelProvider);
    return Scaffold(
      appBar: AppBarWithSearch(
        searchTextEditingController: searchTextEditingController,
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      floatingActionButton: FloatingActionButtonFadedElevation(
        title: "Update Price",
        onTap: () {
          UpdatePriceDialog.builder(context);
        },
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            SizedBox(
              height: updatePriceState.selectedMedsIds.isEmpty ? 0 : 35,
              child: ListView.builder(
                itemCount: 8,
                shrinkWrap: true,

                padding: EdgeInsets.symmetric(horizontal: 16),

                scrollDirection: Axis.horizontal,

                itemBuilder:
                    (context, index) =>
                        updatePriceState.selectedMedsIds.contains(
                              index.toString(),
                            )
                            ? SelectedMedChip(
                              medName: fakeMedModel.name ?? "",

                              onDeleteTap: () {
                                ref
                                    .read(updatePriceViewModelProvider.notifier)
                                    .removeMedicineId(index.toString());
                              },
                            )
                            : SizedBox.shrink(),
              ),
            ),
            SizedBox(height: 10),
            GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .9,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: 8,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:
                  (context, index) => UpdateMedCard(
                    isSelected: updatePriceState.selectedMedsIds.contains(
                      index.toString(),
                    ),
                    medName: fakeMedModel.name ?? "",
                    medPrice: fakeMedModel.price?.toString() ?? "",
                    medTiter:
                        fakeMedModel.pharmaceuticalTiter?.toString() ?? "",
                    imageUrl: fakeMedModel.medImageUrl ?? "",
                    onMedicineTap: () {
                      ref
                          .read(updatePriceViewModelProvider.notifier)
                          .handleOnMedTap(id: index.toString());
                    },
                  ),
            ),

            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
