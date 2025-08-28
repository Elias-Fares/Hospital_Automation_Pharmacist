import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:medicare_pharmacy/core/style/app_colors.dart';
import 'package:medicare_pharmacy/core/widgets/general_image_asset.dart';
import 'package:medicare_pharmacy/core/widgets/textfields/select_option_text_field_v2.dart';
import 'package:medicare_pharmacy/features/edit_profile/view/edit_profile_screen.dart';
import '../../../configuration/res.dart';
import '../../../core/function/get_opening_status.dart';
import '../../../core/function/join_strings.dart';
import '../../../core/models/work_day.dart';
import '../../../core/style/card_container_decoration.dart';
import '../../../core/widgets/appbars/app_bar_title_widget.dart';
import '../../../core/widgets/appbars/sub_app_bar.dart';
import '../../../core/widgets/cards/icon_key_value_widget.dart';
import '../../../core/widgets/cards/icon_title_navigation_button.dart';
import '../../../core/widgets/cards/key_value_card.dart';
import '../../../core/widgets/cards/profile_email_widget.dart';
import '../../../core/widgets/cards/profile_phone_widget.dart';
import '../../../core/widgets/custom_error_widget.dart';
import '../../../core/widgets/custom_loading_widget.dart';
import '../view_model/pharmacy_profile_view_model.dart';
part 'widget/pharmacy_profile_details_section.dart';
part 'widget/pharmacy_profile_navigation_section.dart';
part 'widget/profile_edit_button.dart';

class PharmacyProfileScreen extends ConsumerStatefulWidget {
  const PharmacyProfileScreen({super.key});
  static const routeName = "/pharmacy_profile_screen";

  @override
  ConsumerState<PharmacyProfileScreen> createState() =>
      _PharmacyProfileScreenState();
}

class _PharmacyProfileScreenState extends ConsumerState<PharmacyProfileScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      ref.read(pharmacyProfileViewModelProvider.notifier).showPharmacyProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final pharmacyProfile = ref.watch(pharmacyProfileViewModelProvider);
    return Scaffold(
      appBar: SubAppBar(
        titleWidget: AppBarTitleWidget(
          title: joinStrings([
            pharmacyProfile
                .pharmacyDetailsResponse
                ?.asData
                ?.value
                .user
                ?.firstName,
            pharmacyProfile
                .pharmacyDetailsResponse
                ?.asData
                ?.value
                .user
                ?.lastName,
          ]),
          imagePath:
              pharmacyProfile
                  .pharmacyDetailsResponse
                  ?.asData
                  ?.value
                  .user
                  ?.imgurl,
          subtitle: pharmacyProfile.pharmacyDetailsResponse?.asData?.value.name,
        ),
      ),
      floatingActionButton: ProfileEditButton(
        onPressed: () {
          if (!(pharmacyProfile.pharmacyDetailsResponse?.hasValue ?? false)) {
            return;
          }
          context.push(
            EditProfileScreen.routeName,
            extra: pharmacyProfile.pharmacyDetailsResponse?.asData?.value,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Flexible(
              child:
                  pharmacyProfile.pharmacyDetailsResponse?.when(
                    data:
                        (data) => PharmacyProfileDetailsSection(
                          currentState: getOpeningStatus(data.workDays ?? []),

                          pharmacyaddress: joinStrings([
                            data.addressGovernorate,
                            data.addressCity,
                            data.addressRegion,
                            data.addressStreet,
                          ], joinChart: " - "),
                          residentialsAddress: "",
                          phoneNumber: data.phoneNumber ?? "",
                          // emailAddress: data.user?.email ?? "",
                          availabilitySchedule: (data.workDays ?? <WorkDay>[]),
                          emailAddress: "",
                        ),
                    error:
                        (error, stackTrace) => CustomErrorWidget(
                          height: 400.h,
                          message: error.toString(),
                          onTryAgainTap: () {
                            ref
                                .read(pharmacyProfileViewModelProvider.notifier)
                                .showPharmacyProfile();
                          },
                        ),
                    loading: () => CustomLoadingWidget(),
                  ) ??
                  const SizedBox.shrink(),
            ),
            const SizedBox(height: 24),
            // (!(pharmacyProfile.pharmacyDetailsResponse?.isLoading ?? false))
            //     ? PharmacyProfileNavigationSection(
            //         onPrescriptionTap: () {},
            //         onMedicinesTap: () {},
            //         onContractHistortTap: () {},
            //       )
            //     : const SizedBox.shrink(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
