import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/configuration/res.dart';
import 'package:medicare_pharmacy/configuration/router/router_utils.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/validators/fields_validator.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/custom_outlined_button.dart';
import 'package:medicare_pharmacy/core/widgets/buttons/loading_button.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/features/main/view/main_screen.dart';
import 'package:medicare_pharmacy/features/scanner/view/scanner_screen.dart';
import 'package:medicare_pharmacy/features/specify_sale_amount/view_model/specify_sale_amount_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'widget/sale_completed_dialog.dart';

class SpecifySaleAmountScreen extends ConsumerStatefulWidget {
  const SpecifySaleAmountScreen({
    super.key,
    required this.medicinePrice,
    required this.medicineId,
  });
  static const routeName = "/specify_sale_amount_screen";
  final double medicinePrice;
  final String medicineId;

  @override
  ConsumerState<SpecifySaleAmountScreen> createState() =>
      _SpecifySaleAmountScreenState();
}

class _SpecifySaleAmountScreenState
    extends ConsumerState<SpecifySaleAmountScreen> {
  final amountController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final SpecifySaleAmountViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = ref.read(specifySaleAmountViewModelProvider.notifier);
  }

  @override
  void dispose() {
    _viewModel.reset();

    amountController.dispose();
    debugPrint("SpecifySaleAmountScreen Disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: containerCardDecoration(),
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text(
                      "Specify Sale Amount",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      "This action updates stock levels and sales records.",
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30),
                    TextFormField(
                      controller: amountController,
                      style: Theme.of(context).textTheme.bodyMedium,

                      keyboardType: TextInputType.number,

                      validator:
                          (value) =>
                              FieldsValidator.validateEmpty(value: value ?? ""),

                      decoration: InputDecoration(
                        label: Text("Amount"),
                        fillColor: AppColors.white,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.hintTextColor,
                            width: .5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),

                    // Spacer(),
                    CustomOutlinedButton(
                      title: "Sell",
                      backgroundColor: AppColors.white,
                      onTap: () {
                        if (!(_formKey.currentState?.validate() ?? false)) {
                          return;
                        }

                        _viewModel.addMedicineSale(
                          medicineId: widget.medicineId,
                          unitPrice: widget.medicinePrice,
                          quantity: int.tryParse(amountController.text) ?? 0,
                        );

                        final price = _viewModel.getPrice();
                        SaleCompletedDialog.builder(
                          context,
                          reciptPrice: price.toString(),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: kToolbarHeight),
            ],
          ),
        ),
      ),
    );
  }
}
