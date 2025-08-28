part of '../add_new_medicine_screen.dart';

class ImageSection extends StatelessWidget {
  final String imagePath;
  final void Function()? onReplaceImageTap;

  const ImageSection({
    super.key,

    this.onReplaceImageTap,
    required this.imagePath,
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
            child:
                imagePath.isEmpty
                    ? DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        radius: Radius.circular(12),
                        color: AppColors.hintTextColor,
                      ),
                      child: Container(
                        width: 1.sw,
                        height: 300.h,
                        padding: EdgeInsets.all(60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: AppColors.backgroundColor,
                        ),
                        child: GeneralImageAssets(
                          path: Res.uploadImage,
                          width: 100,
                          height: 100,
                          boxFit: BoxFit.contain,
                        ),
                      ),
                    )
                    : Image.file(
                      File(imagePath),
                      width: MediaQuery.sizeOf(context).width,
                      height: 300.h,
                      fit: BoxFit.cover,
                    ),
          ),

          SizedBox(height: 20),
          CustomOutlinedButton(
            onTap: onReplaceImageTap,
            title: imagePath.isEmpty ? "Add Image" : "Replace Image",
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


