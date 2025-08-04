import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SearchForMedicineTextField(
            searchTextEditingController: searchTextEditingController,
          ),
          SizedBox(height: 20),

          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .9,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: 8,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder:
                (context, index) => MedicineCard(
                  medName: "Brium",
                  medPrice: "20000",
                  medTiter: "100",
                  imageUrl:
                      "https://tse4.mm.bing.net/th/id/OIP.E6GBbEWNpCzxm1XBVtUCcwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
                ),
          ),
        ],
      ),
    );
  }
}
