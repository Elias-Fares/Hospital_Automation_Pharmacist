import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/cards/icon_key_value_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/inventory/view_model/inventory_view_model.dart';

part 'widget/inventory_card.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});
  static const routeName = "/inventory_screen";

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(inventoryViewModelProvider.notifier).getInventory();
    });
  }

  @override
  Widget build(BuildContext context) {
    final InventoryState inventoryState = ref.watch(inventoryViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Daily Inventory",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Total: ${inventoryState.inventoryResponse?.asData?.value.total ?? ""} ${Constant.appCurrency}",
                ),
              ],
            ),
            SizedBox(height: 20),

            inventoryState.inventoryResponse?.when(
                  data:
                      (data) => ListView.builder(
                        itemCount: data.data?.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final order = data.data?.elementAtOrNull(index);
                          return InventoryCard(
                            imageUrl:
                                "${Constant.baseUrl}/${order?.medicine?.medImageUrl ?? ""}",
                            name: order?.medicine?.name ?? "",
                            price:
                                "${order?.price?.toString() ?? ""} ${Constant.appCurrency}",
                            quantity: order?.count?.toString() ?? "",
                          );
                        },
                      ),

                  error:
                      (error, stackTrace) => CustomErrorWidget(
                        height: 400,
                        message: error.toString(),
                        onTryAgainTap: () {
                          ref
                              .read(inventoryViewModelProvider.notifier)
                              .getInventory();
                        },
                      ),

                  loading: () => CustomLoadingWidget(height: 400),
                ) ??
                SizedBox.shrink(),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
