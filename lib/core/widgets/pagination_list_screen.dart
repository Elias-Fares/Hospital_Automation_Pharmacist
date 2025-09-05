import 'package:flutter/material.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class PaginationListScreen extends StatelessWidget {
  //--------Appbar Section--------------------------------------------

  final PreferredSizeWidget? appbar;

  //--------Body Section ---------------------------------------------

  final bool shrinkWrap;
  final int? itemCount;
  final ScrollController? scrollController;
  final Axis scrollDirection;
  final IndexedWidgetBuilder itemBuilder;
  final bool isLoading;
  final int itemCountShimmer;
  final IndexedWidgetBuilder itemBuilderShimmer;
  final Widget? headerWidget;
  final Widget? footerWidget;
  final CrossAxisAlignment columnCrossAxisAlignment;
  final Color? backgroundColor;
  final double? horizontalPadding;

  //----------------Loading Section --------------------------------

  final bool isLoadingPagination;

  const PaginationListScreen({
    super.key,
    this.appbar,

    this.shrinkWrap = true,
    required this.itemCount,
    this.scrollController,
    this.scrollDirection = Axis.vertical,
    required this.itemBuilder,
    this.isLoadingPagination = false,
    this.isLoading = false,
    this.itemCountShimmer = 3,
    required this.itemBuilderShimmer,
    this.headerWidget,
    required this.columnCrossAxisAlignment,
    this.footerWidget,
    this.backgroundColor,
    this.horizontalPadding,
  });

  Widget shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: AppColors.baserColor,
      highlightColor: AppColors.shimmerColor,
      child: ListView.builder(
        shrinkWrap: shrinkWrap,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemCountShimmer,
        scrollDirection: scrollDirection,
        itemBuilder: itemBuilderShimmer,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      key: key,
      //-----------Appbar Section------------------------------------------------
      appBar: appbar,
      //----------------End drawer Section -------------------------------------

      //-----------Body Section------------------------------------------------
      body: SingleChildScrollView(
        controller: scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 20,
        ),
        child: Column(
          crossAxisAlignment: columnCrossAxisAlignment,
          children: [
            if (headerWidget != null) ...[
              const SizedBox(height: 25),
              headerWidget!,
              const SizedBox(height: 15),
            ],
            isLoading
                ? shimmerWidget()
                : ListView.builder(
                  shrinkWrap: shrinkWrap,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: itemCount,
                  scrollDirection: scrollDirection,
                  itemBuilder: itemBuilder,
                ),
            if (footerWidget != null) ...[
              const SizedBox(height: 25),
              footerWidget!,
              const SizedBox(height: 25),
            ],
            if (isLoadingPagination) ...[
              const SizedBox(height: 10),
              CircularProgressIndicator(),
              const SizedBox(height: 10),
            ],
          ],
        ),
      ),
    );

    //-----------End Body Section------------------------------------------------
  }
}
