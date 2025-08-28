import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/class/debouncer.dart';
import 'package:medicare_pharmacy/core/constant/constant.dart';
import 'package:medicare_pharmacy/core/function/date_format.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/app_bar_with_search.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/cards/icon_key_value_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_error_widget.dart';
import 'package:medicare_pharmacy/core/widgets/custom_loading_widget.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
import 'package:medicare_pharmacy/features/orders/view_model/orders_view_model.dart';
part 'widget/order_card.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});
  static const routeName = "/orders_screen";

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  final searchTextEditingController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(ordersViewModelProvider.notifier).getOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ordersState = ref.watch(ordersViewModelProvider);
    return Scaffold(
      appBar: AppBarWithSearch(
        searchTextEditingController: searchTextEditingController,
        onChanged: (value) {
          _debouncer.run(() {
            ref
                .read(ordersViewModelProvider.notifier)
                .getOrders(medicineName: value.isNotEmpty ? value : null);
          });
        },
        actions: [
          IconButton(
            onPressed: () async {
              final date = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              ref
                  .read(ordersViewModelProvider.notifier)
                  .getOrders(date: date?.getYearMonthDay());
            },
            icon: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.textColor,
              size: 20,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ordersState.ordersResponse?.when(
        data: (data) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            itemCount: data.length,

            itemBuilder: (context, index) {
              final order = data.elementAtOrNull(index);
              return OrderCard(
                imageUrl:
                    "${Constant.baseUrl}/${order?.medicine?.medImageUrl ?? ""}",
                name: order?.medicine?.name ?? "",
                price:
                    "${order?.price?.toString() ?? ""} ${Constant.appCurrency}",
                quantity: order?.count?.toString() ?? "",
              );
            },
          );
        },
        error:
            (error, stackTrace) => CustomErrorWidget(
              message: error.toString(),
              onTryAgainTap: () {
                ref.read(ordersViewModelProvider.notifier).getOrders();
              },
            ),
        loading: () => CustomLoadingWidget(),
      ),
    );
  }
}
