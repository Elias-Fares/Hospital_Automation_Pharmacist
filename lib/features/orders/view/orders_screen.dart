import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/app_bar_with_search.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/cards/icon_key_value_widget.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';
part 'widget/order_card.dart';

class OrdersScreen extends ConsumerStatefulWidget {
  const OrdersScreen({super.key});
  static const routeName = "/orders_screen";

  @override
  ConsumerState<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends ConsumerState<OrdersScreen> {
  // List<String> fakeDates = [
  //   "06-08-2025",
  //   "06-08-2025",
  //   "06-08-2025",
  //   "04-08-2025",
  //   "03-08-2025",
  // ];

  final searchTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearch(
        searchTextEditingController: searchTextEditingController,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.calendar_month_outlined,
              color: AppColors.textColor,
              size: 20,
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: 5,

        /*
       
                 final date = fakeDates.elementAt(index);

          if (index == 0) {
            return Text(
              date,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.onPrimaryContainer,
                fontWeight: FontWeight.w500,
              ),
            );
          } else {
            final previousElement = fakeDates.elementAt(index - 1);
            if (date == previousElement) {
              return SizedBox.shrink();
            } else {
              return Text(
                date,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                ),
              );
            }
          }
       
        */
        itemBuilder: (context, index) {
          return OrderCard(
            imageUrl:
                "https://tse4.mm.bing.net/th/id/OIP.E6GBbEWNpCzxm1XBVtUCcwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
            name: "Vitamin D",
            price: "2000 S.P.",
            quantity: "2",
          );
        },
      ),
    );
  }
}
