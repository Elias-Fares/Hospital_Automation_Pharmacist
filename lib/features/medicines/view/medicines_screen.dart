import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/class/debouncer.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
import 'package:medicare_pharmacy/features/medicines/view_model/medicines_view_model.dart';
part 'widget/search_for_medicine_text_field.dart';
part 'widget/medicine_card.dart';

class MedicinesScreen extends ConsumerStatefulWidget {
  const MedicinesScreen({super.key});
  static const routeName = "/medicines_screen";

  @override
  ConsumerState<MedicinesScreen> createState() => _MedicinesScreenState();
}

class _MedicinesScreenState extends ConsumerState<MedicinesScreen> {
  final searchTextEditingController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 1000);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.microtask(() {
      ref.read(medicinesViewModelProvider.notifier).getMedicines();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _debouncer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final medicinesResponse =
        ref.watch(medicinesViewModelProvider).medicinesResponse;
    return RefreshIndicator(
      onRefresh: () async {
        ref
            .read(medicinesViewModelProvider.notifier)
            .getMedicines(name: searchTextEditingController.text);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SearchForMedicineTextField(
              searchTextEditingController: searchTextEditingController,
              onChanged: (value) {
                _debouncer.run(() async {
                  ref
                      .read(medicinesViewModelProvider.notifier)
                      .getMedicines(name: value);
                });
              },
            ),
            SizedBox(height: 20),

            Expanded(
              child:
                  medicinesResponse?.when(
                    data:
                        (data) => GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: .9,
                                mainAxisSpacing: 8,
                                crossAxisSpacing: 8,
                              ),
                          itemCount: data.length,
                          // shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final med = data.elementAtOrNull(index);
                            return MedicineCard(
                              medName: med?.name ?? "",
                              medPrice: med?.price?.toString() ?? "",
                              medTiter:
                                  med?.pharmaceuticalTiter?.toString() ?? "",
                              imageUrl:
                                  "${Constant.baseUrl}/${med?.medImageUrl ?? ""}",
                              onMedicineTap: () {
                                context.push(
                                  MedicineDetailsScreen.routeName,
                                  extra: med,
                                );
                              },
                            );
                          },
                        ),
                    error:
                        (error, stackTrace) => CustomErrorWidget(
                          message: error.toString(),
                          onTryAgainTap: () {
                            ref
                                .read(medicinesViewModelProvider.notifier)
                                .getMedicines(
                                  name: searchTextEditingController.text,
                                );
                          },
                        ),
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
