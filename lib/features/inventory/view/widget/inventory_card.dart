part of '../inventory_screen.dart';

class InventoryCard extends StatelessWidget {
  const InventoryCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.quantity,
    required this.price,
  });

  final String imageUrl;
  final String name;
  final String quantity;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 8),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                clipBehavior: Clip.hardEdge,
                child: GeneralNetworkImage(
                  url: imageUrl,
                  boxFit: BoxFit.cover,
                  width: 40,
                  height: 40,
                ),
              ),

              SizedBox(width: 10),
              Text(name, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),

          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconKeyValueWidget(
                keyTitle: "Quantity",
                value: quantity,
                iconData: Icons.shopping_bag_outlined,
              ),
              IconKeyValueWidget(
                keyTitle: "Price",
                value: price,
                iconData: Icons.monetization_on_outlined,
              ),

              SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
