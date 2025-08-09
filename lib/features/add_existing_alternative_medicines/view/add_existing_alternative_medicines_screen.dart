import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/class/debouncer.dart';
import 'package:medicare_pharmacy/core/enums/attach_status.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/app_bar_with_search.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/add_existing_alternative_medicines/view_model/add_existing_alternative_medicines_view_model.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';
part 'widget/add_alt_med_card.dart';

class AddExistingAlternativeMedicinesScreen extends ConsumerStatefulWidget {
  const AddExistingAlternativeMedicinesScreen({super.key});
  static const routeName = "/add_existing_alternative_medicines_screen";

  @override
  ConsumerState<AddExistingAlternativeMedicinesScreen> createState() =>
      _AddExistingAlternativeMedicinesScreenState();
}

class _AddExistingAlternativeMedicinesScreenState
    extends ConsumerState<AddExistingAlternativeMedicinesScreen> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  final _debouncer = Debouncer(milliseconds: 1000);
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref
          .read(addExistingAlternativeMedicinesViewModelProvider.notifier)
          .getMedicines();
    });
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addAlteState = ref.watch(
      addExistingAlternativeMedicinesViewModelProvider,
    );
    return Scaffold(
      appBar: AppBarWithSearch(
        searchTextEditingController: searchTextEditingController,
        onChanged: (value) {
          _debouncer.run(() {
            ref
                .read(addExistingAlternativeMedicinesViewModelProvider.notifier)
                .getMedicines(name: value);
          });
        },
      ),
      body:
          addAlteState.medicinesResponse?.when(
            data:
                (data) => GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: .75,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                  itemCount: data.length,

                  itemBuilder: (context, index) {
                    final med = data.elementAtOrNull(index);
                    final status =
                        addAlteState.attachStatuses[index] ??
                        AttachStatus.notAttached;
                    return AddAltMedCard(
                      attachStatus: status,
                      medName: med?.name ?? "",
                      medPrice: med?.price?.toString() ?? "",
                      medTiter: med?.pharmaceuticalTiter?.toString() ?? "",
                      imageUrl: med?.medImageUrl ?? "",
                      onMedicineTap: () {
                        context.push(
                          MedicineDetailsScreen.routeName,
                          extra: med,
                        );
                      },
                      onAddAlt: () {
                        //logic
                        ref
                            .read(
                              addExistingAlternativeMedicinesViewModelProvider
                                  .notifier,
                            )
                            .addAlt(index);
                      },
                    );
                  },
                ),
            error:
                (error, stackTrace) => CustomErrorWidget(
                  message: error.toString(),
                  onTryAgainTap: () {
                    ref
                        .read(
                          addExistingAlternativeMedicinesViewModelProvider
                              .notifier,
                        )
                        .getMedicines(name: searchTextEditingController.text);
                  },
                ),
            loading: () => CustomLoadingWidget(),
          ) ??
          SizedBox(),
    );
  }
}
