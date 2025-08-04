part of '../edit_medicine_screen.dart';

class ImageSection extends StatelessWidget {
  final String imageUrl;
  final void Function()? onReplaceImageTap;

  const ImageSection({
    super.key,
    required this.imageUrl,
    this.onReplaceImageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GeneralNetworkImage(
              url: imageUrl,

              width: MediaQuery.sizeOf(context).width,
              height: 380.h,
            ),
          ),

          SizedBox(height: 20),
          CustomOutlinedButton(
            onTap: onReplaceImageTap,
            title: "Replace Image",
            backgroundColor: AppColors.white,
            icon: Icon(
              Icons.image_outlined,
              color: AppColors.primary,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}
