import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/style/card_container_decoration.dart';
import 'package:medicare_pharmacy/core/widgets/appbars/sub_app_bar.dart';
import 'package:medicare_pharmacy/core/widgets/cards/icon_key_value_widget.dart';
import 'package:medicare_pharmacy/core/widgets/general_network_image.dart';

part 'widget/inventory_card.dart';

class InventoryScreen extends ConsumerStatefulWidget {
  const InventoryScreen({super.key});
  static const routeName = "/inventory_screen";

  @override
  ConsumerState<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends ConsumerState<InventoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: Text(
          "Inventory",
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
                Text("Total: 350 000 S.P."),
              ],
            ),
            SizedBox(height: 20),

            ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return InventoryCard(
                  imageUrl:
                      "https://tse4.mm.bing.net/th/id/OIP.E6GBbEWNpCzxm1XBVtUCcwHaHa?r=0&rs=1&pid=ImgDetMain&o=7&rm=3",
                  name: "Vitamin D",
                  price: "2000 S.P.",
                  quantity: "2",
                );
              },
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
