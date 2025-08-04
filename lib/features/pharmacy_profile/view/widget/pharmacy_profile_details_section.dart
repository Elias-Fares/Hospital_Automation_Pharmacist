part of '../pharmacy_profile_screen.dart';

class PharmacyProfileDetailsSection extends StatelessWidget {
  const PharmacyProfileDetailsSection({
    super.key,
    required this.phoneNumber,
    required this.emailAddress,
    this.onPhoneNumberTap,
    this.onEmailTap,
    required this.residentialsAddress,
    required this.pharmacyaddress,
    required this.currentState,
    required this.availabilitySchedule,
  });

  final String residentialsAddress;
  final String pharmacyaddress;
  final String currentState;
  final List<WorkDay> availabilitySchedule;

  final String phoneNumber;
  final String emailAddress;

  final void Function()? onPhoneNumberTap;
  final void Function()? onEmailTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerCardDecoration(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        IconKeyValueWidget(
          iconData: Icons.location_on_rounded,
          keyTitle: "Pharmacy address",
          value: pharmacyaddress,
          width: 280.w,
        ),
        const SizedBox(
          height: 20,
        ),
        IconKeyValueWidget(
            iconData: Icons.av_timer_rounded,
            keyTitle: "Current Status",
            value: currentState),
        const SizedBox(
          height: 20,
        ),
        // IconKeyValueWidget(
        //     iconData: Icons.location_on_outlined,
        //     keyTitle: "Residential address",
        //     value: residentialsAddress),
        // const SizedBox(
        //   height: 20,
        // ),
        Text(
          "Availability Schedule",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            availabilitySchedule.length,
            (index) => KeyValueCard(
                keyTitle: availabilitySchedule.elementAt(index).day ?? "",
                value: joinStrings([
                  availabilitySchedule.elementAt(index).workStartTime,
                  availabilitySchedule.elementAt(index).workEndTime,
                ], joinChart: " - ")),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          children: [
            ProfilePhoneWidget(
              phoneNumber: phoneNumber,
              onTap: onPhoneNumberTap,
            ),
            const SizedBox(
              width: 8,
            ),
            ProfileEmailWidget(
              onTap: onEmailTap,
            )
          ],
        )
      ]),
    );
  }
}
