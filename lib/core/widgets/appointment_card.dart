import 'package:flutter/material.dart';
import '../../configuration/res.dart';
import '../style/app_colors.dart';
import 'buttons/custom_inkwell.dart';
import 'cards/outlined_card.dart';
import 'cards/svg_container.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    required this.name,
    required this.type,
    required this.dateTime,
    required this.doctorName,
    this.onAppointmentCardTap,
  });

  final String name;
  final String type;
  final String dateTime;
  final String doctorName;
  final void Function()? onAppointmentCardTap;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: CustomInkwell(
          onTap: onAppointmentCardTap,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SvgContainer(
                      imgPath: Res.childCardIcon,
                      imageWidth: 25,
                      imageHieght: 25,
                    ),
                    const SizedBox(width: 12),
                    Text(name,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontSize: 15)),
                    const Spacer(),
                    OutlinedCard(text: type)
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SvgContainer(imgPath: Res.calendarIcon),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date & Time",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.hintTextColor),
                        ),
                        Text(dateTime),
                      ],
                    ),
                    const Spacer(),
                    ClipOval(
                      child: Image.asset(
                        Res.personePlaceHolderImage,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Doctor",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.hintTextColor),
                        ),
                        Text(doctorName),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
