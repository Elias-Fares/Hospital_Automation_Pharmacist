import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/core/widgets/floating_action_button_with_faded_elevation.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/add_existing_alternative_medicines/view/add_existing_alternative_medicines_screen.dart';
import 'package:medicare_pharmacy/features/alternative_medicines/view_model/alternative_medicines_view_model.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
part 'widget/alternative_medicine_card.dart';

class AlternativeMedicinesScreen extends ConsumerStatefulWidget {
  const AlternativeMedicinesScreen({super.key, required this.medId});
  static const routeName = "/alternative_medicines_screen";

  final String medId;

  @override
  ConsumerState<AlternativeMedicinesScreen> createState() =>
      _AlternativeMedicinesScreenState();
}

class _AlternativeMedicinesScreenState
    extends ConsumerState<AlternativeMedicinesScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(alternativeMedicinesViewModelProvider.notifier)
          .getAlternativeMedicines(medId: widget.medId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final alternativesState = ref.watch(alternativeMedicinesViewModelProvider);

    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          alternativesState.altsResponse?.asData?.value.medicine?.name ?? "",
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtonFadedElevation(
        onTap: () {
          context.push(AddExistingAlternativeMedicinesScreen.routeName);
        },
        title: "Add New",
      ),
      body:
          alternativesState.altsResponse?.when(
            data:
                (data) => GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: data.medicine?.alternative?.length ?? 0,

                  itemBuilder: (context, index) {
                    final altMed =
                        data.medicine?.alternative
                            ?.elementAtOrNull(index)
                            ?.medicine;
                    final relationId =
                        data.medicine?.alternative
                            ?.elementAtOrNull(index)
                            ?.id
                            ?.toString();

                    final isLoading =
                        alternativesState.detachLoading[relationId] ?? false;
                    return AlternativeMedicineCard(
                      isLoading: isLoading,
                      medName: altMed?.name ?? "",
                      medPrice: altMed?.price?.toString() ?? "",
                      medTiter: altMed?.pharmaceuticalTiter?.toString() ?? "",
                      imageUrl:
                          "${Constant.baseUrl}/${altMed?.medImageUrl ?? ""}",
                      onMedicineTap: () {
                        context.push(
                          MedicineDetailsScreen.routeName,
                          extra: altMed,
                        );
                      },
                      onDetachTap: () {
                        ref
                            .read(
                              alternativeMedicinesViewModelProvider.notifier,
                            )
                            .detach(id: relationId);
                      },
                    );
                  },
                ),
            error:
                (error, stackTrace) => CustomErrorWidget(
                  message: error.toString(),
                  onTryAgainTap: () {
                    ref
                        .read(alternativeMedicinesViewModelProvider.notifier)
                        .getAlternativeMedicines(medId: widget.medId);
                  },
                ),
            loading: () => CustomLoadingWidget(),
          ) ??
          SizedBox.shrink(),
    );
  }
}
