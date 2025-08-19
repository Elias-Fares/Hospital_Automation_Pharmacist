part of '../medicine_details_screen.dart';

class MedicineDetailsWidget extends StatelessWidget {
  const MedicineDetailsWidget({
    super.key,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.titer,
    required this.composition,
    required this.indication,
    required this.company,
    required this.allownace,
    required this.batchesCount,
    required this.lowBound,
    this.onBatchesTap,
  });

  final String name;
  final String price;
  final String imageUrl;
  final String titer;
  final String composition;
  final String indication;
  final String company;
  final String allownace;
  final String lowBound;

  final int batchesCount;
  final void Function()? onBatchesTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(
          //   height: 16,
          // ),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GeneralNetworkImage(
              url: imageUrl,
              // url:
              //     "https://th.bing.com/th/id/R.dcd85fd802de08a660ef70274abd6549?rik=jEnBkxetovWJxA&pid=ImgRaw&r=0",
              width: MediaQuery.sizeOf(context).width,
              height: 380.h,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name, style: Theme.of(context).textTheme.titleMedium),
              Text(
                price,
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Titer",
            value: titer,
            iconPath: Res.medicineTiter,
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Allownace",
            value: allownace,
            iconPath: Res.prescriptionsIcon,
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Company",
            value: company,
            iconPath: Res.medicineCompany,
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Low Bound ",
            value: lowBound,
            iconPath: Res.medicineTiter,
          ),
          const SizedBox(height: 16),
          IconKeyValueWidget(
            keyTitle: "Batches",
            value: "$batchesCount total",
            iconPath: Res.batchIcon,
            onTap: onBatchesTap,
            needOnTap: true,
          ),

          const SizedBox(height: 16),
          Text(
            "Pharmaceutical composition",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Text(composition, style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 16),
          Text(
            "Pharmaceutical Indication",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 8),
          Text(indication, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
