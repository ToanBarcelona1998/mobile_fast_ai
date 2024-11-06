// import 'package:mobile_fast_ai/src/application/global/app_theme/app_theme.dart';
// import 'package:mobile_fast_ai/src/application/localization/localization_manager.dart';
// import 'package:mobile_fast_ai/src/cores/constants/app_typography.dart';
// import 'package:mobile_fast_ai/src/cores/constants/language_key.dart';
// import 'package:mobile_fast_ai/src/cores/constants/size_constant.dart';
// import 'package:mobile_fast_ai/src/cores/utils/context_extension.dart';
// import 'package:mobile_fast_ai/src/presentation/widgets/app_bottom_sheet_provider.dart';
// import 'package:mobile_fast_ai/src/presentation/widgets/app_button.dart';
// import 'package:mobile_fast_ai/src/presentation/widgets/divider_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_flutter/qr_flutter.dart';
//
// class CreatorShowQrCodeWidget extends AppBottomSheetProviderWidget {
//   final AppLocalizationManager localization;
//   final String url;
//   final String creatorName;
//
//   const CreatorShowQrCodeWidget({
//     required super.appTheme,
//     required this.localization,
//     required this.url,
//     required this.creatorName,
//     super.fit = ChoiceModalFit.fill,
//     super.key,
//   });
//
//   @override
//   Widget? bottomBuilder(BuildContext context, AppTheme appTheme) {
//     return Column(
//       children: [
//         HoLiZonTalDividerWidget(
//           appTheme: appTheme,
//         ),
//         const SizedBox(
//           height: BoxSize.boxSize05,
//         ),
//         Row(
//           children: [
//             Expanded(
//               child: PrimaryAppButton(
//                 text: localization.translate(
//                   LanguageKey.creatorDetailScreenShareQrCode,
//                 ),
//                 backGroundColor: appTheme.primaryColor50,
//                 textStyle: AppTypography.bodyXLargeSemiBold.copyWith(
//                   color: appTheme.primaryColor900,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               width: BoxSize.boxSize04,
//             ),
//             Expanded(
//               child: PrimaryAppButton(
//                 text: localization.translate(
//                   LanguageKey.creatorDetailScreenSaveQrCode,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget contentBuilder(BuildContext context, AppTheme appTheme) {
//     return Column(
//       children: [
//         HoLiZonTalDividerWidget(
//           appTheme: appTheme,
//         ),
//         Container(
//           margin: const EdgeInsets.symmetric(
//             vertical: BoxSize.boxSize05,
//           ),
//           padding: const EdgeInsets.all(
//             Spacing.spacing06,
//           ),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               BorderRadiusSize.borderRadius04,
//             ),
//             border: Border.all(
//               color: appTheme.primaryColor900,
//               width: BorderSize.border02,
//             ),
//           ),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               QrImageView(
//                 data: url,
//                 backgroundColor: appTheme.bodyBackGroundColor,
//                 version: QrVersions.auto,
//                 padding: EdgeInsets.zero,
//                 size: context.w - Spacing.spacing06 * 2 - Spacing.spacing07 * 2,
//               ),
//               const SizedBox(
//                 height: BoxSize.boxSize05,
//               ),
//               Text(
//                 creatorName,
//                 style: AppTypography.heading3Bold.copyWith(
//                   color: appTheme.primaryColor900,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Text(
//           localization.translate(
//             LanguageKey.creatorDetailScreenShowQrCodeContent,
//           ),
//           style: AppTypography.bodyXLargeRegular.copyWith(
//             color: appTheme.greyScaleColor900,
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget? titleBuilder(BuildContext context, AppTheme appTheme) {
//     return Center(
//       child: Text(
//         localization.translate(
//           LanguageKey.creatorDetailScreenShowQrCode,
//         ),
//         style: AppTypography.heading4Bold.copyWith(
//           color: appTheme.greyScaleColor900,
//         ),
//       ),
//     );
//   }
// }
