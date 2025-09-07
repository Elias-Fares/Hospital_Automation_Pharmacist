import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/configuration/router/router_utils.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_inkwell.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/cards/loading_card.dart';
import 'package:medicare_pharmacy/core/widgets/floating_action_button_with_faded_elevation.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/core/widgets/scan_code_dialog.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_error_message.dart';
import 'package:medicare_pharmacy/core/widgets/show_snack_bar_success_message.dart';
import 'package:medicare_pharmacy/data/models/medicine_model.dart';
import 'package:medicare_pharmacy/features/medicine_details/view/medicine_details_screen.dart';

import 'package:medicare_pharmacy/features/scanner/view/scanner_screen.dart';
import 'package:medicare_pharmacy/features/specify_sale_amount/view_model/specify_sale_amount_view_model.dart';

part 'widget/sale_completed_dialog.dart';
part 'widget/medicine_order_card.dart';
part 'widget/add_new_medicine_order_card.dart';
part 'widget/specify_sale_amount_dialog.dart';

class SpecifySaleAmountScreen extends ConsumerStatefulWidget {
  const SpecifySaleAmountScreen({super.key, required this.medicineModel});
  static const routeName = "/specify_sale_amount_screen";
  final MedicineModel? medicineModel;

  @override
  ConsumerState<SpecifySaleAmountScreen> createState() =>
      _SpecifySaleAmountScreenState();
}

class _SpecifySaleAmountScreenState
    extends ConsumerState<SpecifySaleAmountScreen> {
  late final SpecifySaleAmountViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      _viewModel = ref.read(specifySaleAmountViewModelProvider.notifier);
      _viewModel.addMedicineOrder(medicineModel: widget.medicineModel);
    });
  }

  @override
  void dispose() {
    debugPrint("SpecifySaleAmountScreen Disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(specifySaleAmountViewModelProvider);

    ref.listen(
      specifySaleAmountViewModelProvider.select(
        (value) => value.fetchMedicineResponse,
      ),
      (previous, next) => next?.when(
        data: (data) {
          _viewModel.addMedicineOrder(medicineModel: data);
        },
        error: (error, stackTrace) {
          showSnackBarErrorMessage(context, message: error.toString());
        },
        loading: () {},
      ),
    );
    ref.listen(
      specifySaleAmountViewModelProvider.select(
        (value) => value.sellingResponse,
      ),
      (previous, next) => next?.when(
        data: (data) {
          showSnackBarSuccessMessage(
            context,
            message: "Order sold successfully",
          );
        },
        error: (error, stackTrace) {
          showSnackBarErrorMessage(context, message: error.toString());
        },
        loading: () {},
      ),
    );
    return Scaffold(
      appBar: SubAppBar(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: LoadingButton(
          title: "Sell",
          isLoading: ordersState.sellingResponse?.isLoading ?? false,

          onTap: () {
            _viewModel.sellRequest();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 10),

            Row(
              children: [
                Icon(
                  Icons.monetization_on_outlined,
                  size: 20,
                  color: AppColors.primary,
                ),
                SizedBox(width: 3),
                Text(
                  "Total: ${ordersState.totalPrice} ${Constant.appCurrency}",
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 235,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
              ),
              itemCount: ordersState.medicines.length + 1,
              itemBuilder: (context, index) {
                if (index == ordersState.medicines.length) {
                  if (ordersState.fetchMedicineResponse?.isLoading ?? false) {
                    return LoadingCard(borderRadius: BorderRadius.circular(8));
                  } else {
                    return AddNewMedicineOrderCard(
                      onTap: () async {
                        final scannedCode = await ScanCodeDialog.builder(
                          context,
                        );
                        _viewModel.fetchMedicineByBarcode(
                          code: scannedCode ?? "",
                        );
                      },
                    );
                  }
                }
                final medicineOrder = ordersState.medicines.elementAt(index);
                return MedicineOrderCard(
                  onMedicineTap: () {
                    context.push(
                      MedicineDetailsScreen.routeName,
                      extra: medicineOrder.medicineModel,
                    );
                  },
                  onSpecifySaleAmountTap: () async {
                    final quantity = await SpecifySaleAmountDialog.builder(
                      context,
                    );
                    if (quantity != null) {
                      _viewModel.setQuantity(
                        newQuantity: quantity,
                        medicineOrderIndex: index,
                      );
                    }
                  },
                  quantity: medicineOrder.quantity,
                  medName: medicineOrder.medicineModel.name ?? "",
                  medPrice: medicineOrder.medicineModel.price?.toString() ?? "",
                  medTiter:
                      medicineOrder.medicineModel.pharmaceuticalTiter
                          ?.toString() ??
                      "",
                  imageUrl:
                      "${Constant.baseUrl}/${medicineOrder.medicineModel.medImageUrl ?? ""}",
                );
              },
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
