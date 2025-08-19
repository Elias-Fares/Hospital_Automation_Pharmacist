import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/constant/extra_keys.dart';
import 'package:medicare_pharmacy/core/enums/dispence_status.dart';
import 'package:medicare_pharmacy/core/models/prescription_medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_success_message.dart';
import 'package:medicare_pharmacy/features/dispense_alt_medicines/view/dispense_alt_medicines_screen.dart';
import 'package:medicare_pharmacy/features/dispense_medicines/view_model/dispense_medicines_view_model.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
part 'widget/medicine_dispense_card.dart';
part 'widget/specify_count_dialog.dart';

class DispenseMedicinesScreen extends ConsumerStatefulWidget {
  const DispenseMedicinesScreen({super.key, required this.medicines});
  static const routeName = "/dispense_medicines_screen";
  final List<PrescriptionMedicine>? medicines;

  @override
  ConsumerState<DispenseMedicinesScreen> createState() =>
      _DispenseMedicinesScreenState();
}

class _DispenseMedicinesScreenState
    extends ConsumerState<DispenseMedicinesScreen> {
  @override
  Widget build(BuildContext context) {
    final dispenseMedsState = ref.watch(dispenseMedicinesViewModelProvider);

    ref.listen(
      dispenseMedicinesViewModelProvider.select(
        (value) => value.markAsDispencedResponse,
      ),
      (previous, next) => next?.when(
        data:
            (data) => showSnackBarSuccessMessage(
              context,
              message: "The medicine dispenced successfully",
            ),
        error:
            (error, stackTrace) =>
                showSnackBarErrorMessage(context, message: error.toString()),
        loading: () {},
      ),
    );
    return Scaffold(
      // appBar: AppBarWithSearch(
      //   searchTextEditingController: searchTextEditingController,
      // ),
      appBar: SubAppBar(),

      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .75,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: widget.medicines?.length ?? 0,

        itemBuilder: (context, index) {
          final prescriptionMedicine = widget.medicines?.elementAtOrNull(index);
          var status =
              dispenseMedsState.dispenceStatus[prescriptionMedicine
                  ?.prescriptionMedicinesId
                  ?.toString()] ??
              DispenceStatus.notDispenced;

          // this condition to check whether the medicine is already dispenced or not
          if (prescriptionMedicine?.pharmacyId != null) {
            status = DispenceStatus.dispenced;
          }

          final med = prescriptionMedicine?.medicine;

          final needAlt = ref
              .read(dispenseMedicinesViewModelProvider.notifier)
              .needAlt(medicine: med?.pharmacyMedicines?.firstOrNull);

          return MedicineDispenseCard(
            showDispenseAlt: (needAlt && status != DispenceStatus.dispenced),
            dispenceStatus: status,
            altsCount: 3,
            medName: med?.name ?? "",
            medPrice: med?.price?.toString() ?? "",
            medTiter: med?.pharmaceuticalTiter?.toString() ?? "",
            imageUrl: "${Constant.baseUrl}/${med?.medImageUrl ?? ""}",
            onMedicineTap: () {
              context.push(MedicineDetailsScreen.routeName, extra: med);
            },

            onDespenseTap: () {
              SpecifyCountDialog.builder(
                context,
                pharmacyMedicineId:
                    prescriptionMedicine?.prescriptionMedicinesId,
              );
            },
            onAltTap: () {
              context.push(
                DispenseAltMedicinesScreen.routeName,
                extra: {
                  ExtraKeys.medId: med?.medicinesId,
                  ExtraKeys.prescriptionMedicineId:
                      prescriptionMedicine?.prescriptionMedicinesId,
                },
              );
            },
          );
        },
      ),
    );
  }
}
