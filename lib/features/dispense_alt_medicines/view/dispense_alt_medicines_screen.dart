import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/models/medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
part 'widget/alt_med_dispense_card.dart';

class DispenseAltMedicinesScreen extends ConsumerStatefulWidget {
  const DispenseAltMedicinesScreen({super.key});
  static const routeName = "/dispense_alt_medicines_screen";

  @override
  ConsumerState<DispenseAltMedicinesScreen> createState() =>
      _DispenseAltMedicinesScreenState();
}

class _DispenseAltMedicinesScreenState
    extends ConsumerState<DispenseAltMedicinesScreen> {
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
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Alternatives",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      body: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .75,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemCount: 3,

        itemBuilder:
            (context, index) => AltMedDispenseCard(
              medName: fakeMedModel.name ?? "",
              medPrice: fakeMedModel.price?.toString() ?? "",
              medTiter: fakeMedModel.pharmaceuticalTiter?.toString() ?? "",
              imageUrl: fakeMedModel.medImageUrl ?? "",
              onMedicineTap: () {
                context.push(
                  MedicineDetailsScreen.routeName,
                  extra: fakeMedModel,
                );
              },

              onDespenseTap: () {},
            ),
      ),
    );
  }
}
