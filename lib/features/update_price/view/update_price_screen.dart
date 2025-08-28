import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/class/debouncer.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/entities/med_entity.dart';
import 'package:medicare_pharmacy/core/enums/params_values.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_success_message.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
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
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(updatePriceViewModelProvider.notifier).getMedicines();
    });
  }

  @override
  Widget build(BuildContext context) {
    final updatePriceState = ref.watch(updatePriceViewModelProvider);
    return Scaffold(
      appBar: AppBarWithSearch(
        searchTextEditingController: searchTextEditingController,
        onChanged: (value) {
          _debouncer.run(() {
            ref
                .read(updatePriceViewModelProvider.notifier)
                .getMedicines(name: value);
          });
        },
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
              height: updatePriceState.selectedMeds.isEmpty ? 0 : 35,
              child: ListView.builder(
                itemCount: updatePriceState.selectedMeds.length,
                shrinkWrap: true,

                padding: EdgeInsets.symmetric(horizontal: 16),

                scrollDirection: Axis.horizontal,

                itemBuilder: (context, index) {
                  final medEntity = updatePriceState.selectedMeds.elementAt(
                    index,
                  );
                  return SelectedMedChip(
                    medName: medEntity.name,

                    onDeleteTap: () {
                      ref
                          .read(updatePriceViewModelProvider.notifier)
                          .removeMedicineId(medEntity);
                    },
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            updatePriceState.medicinesResponse?.when(
                  loading: () => CustomLoadingWidget(height: 1.sh * .75),
                  error:
                      (error, stackTrace) => CustomErrorWidget(
                        message: error.toString(),
                        // height: 300,
                        height: 1.sh * .75,
                        onTryAgainTap: () {
                          ref
                              .read(updatePriceViewModelProvider.notifier)
                              .getMedicines(
                                name: searchTextEditingController.text,
                              );
                        },
                      ),

                  data:
                      (data) => GridView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .9,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                        ),
                        itemCount: data.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final med = data.elementAt(index);
                          return UpdateMedCard(
                            isSelected: updatePriceState.selectedMeds.contains(
                              MedEntity(
                                id: med.medicinesId ?? -1,
                                name: med.name ?? "",
                              ),
                            ),
                            medName: med.name ?? "",
                            medPrice: med.price?.toString() ?? "",
                            medTiter: med.pharmaceuticalTiter?.toString() ?? "",
                            imageUrl:
                                "${Constant.baseUrl}/${med.medImageUrl ?? ""}",
                            onMedicineTap: () {
                              ref
                                  .read(updatePriceViewModelProvider.notifier)
                                  .handleOnMedTap(
                                    entity: MedEntity(
                                      id: med.medicinesId ?? -1,
                                      name: med.name ?? "",
                                    ),
                                  );
                            },
                          );
                        },
                      ),
                ) ??
                SizedBox.shrink(),

            SizedBox(height: 90),
          ],
        ),
      ),
    );
  }
}
