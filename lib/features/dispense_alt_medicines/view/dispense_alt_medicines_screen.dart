import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/enums/dispence_status.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/dispense_alt_medicines/view_model/dispense_alt_medicines_view_model.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
part 'widget/alt_med_dispense_card.dart';
part 'widget/specify_alt_count_dialog.dart';

class DispenseAltMedicinesScreen extends ConsumerStatefulWidget {
  const DispenseAltMedicinesScreen({
    super.key,
    required this.medId,
    required this.prescriptionMedicineId,
  });
  static const routeName = "/dispense_alt_medicines_screen";
  // this to fetch the alternatives of this medicine
  final int? medId;
  // this for the dispensing process as original medicine
  final int? prescriptionMedicineId;

  @override
  ConsumerState<DispenseAltMedicinesScreen> createState() =>
      _DispenseAltMedicinesScreenState();
}

class _DispenseAltMedicinesScreenState
    extends ConsumerState<DispenseAltMedicinesScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(dispenseAltMedicinesViewModelProvider.notifier)
          .getAlternativeMedicines(medId: widget.medId?.toString() ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    final alternativesState = ref.watch(dispenseAltMedicinesViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Alternatives",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      body: alternativesState.altsResponse?.when(
        data:
            (alternatives) => GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .75,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: alternatives.medicine?.alternative?.length ?? 0,

              itemBuilder: (context, index) {
                final alternativeMed =
                    alternatives.medicine?.alternative
                        ?.elementAt(index)
                        .medicine;

                var status =
                    alternativesState.dispenseState[alternativeMed?.medicinesId
                        ?.toString()] ??
                    DispenceStatus.notDispenced;

                return AltMedDispenseCard(
                  dispenceStatus: status,
                  medName: alternativeMed?.name ?? "",
                  medPrice: alternativeMed?.price?.toString() ?? "",
                  medTiter:
                      alternativeMed?.pharmaceuticalTiter?.toString() ?? "",
                  imageUrl:
                      "${Constant.baseUrl}/${alternativeMed?.medImageUrl ?? ""}",
                  onMedicineTap: () {
                    context.push(
                      MedicineDetailsScreen.routeName,
                      extra: alternativeMed,
                    );
                  },

                  onDespenseTap: () {
                    SpecifyAltCountDialog.builder(
                      context,
                      pharmacyMedicineId: widget.prescriptionMedicineId,
                      altMedicineId: alternativeMed?.medicinesId,
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
                    .read(dispenseAltMedicinesViewModelProvider.notifier)
                    .getAlternativeMedicines(
                      medId: widget.medId?.toString() ?? "",
                    );
              },
            ),
        loading: () => CustomLoadingWidget(),
      ),
    );
  }
}
