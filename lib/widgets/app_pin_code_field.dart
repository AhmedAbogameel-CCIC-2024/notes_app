// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// import '../core/utils/colors.dart';
//
// class AppPinCodeField extends StatelessWidget {
//   const AppPinCodeField({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return PinCodeTextField(
//       length: 4,
//       obscureText: false,
//       animationType: AnimationType.fade,
//       keyboardType: TextInputType.number,
//       pinTheme: PinTheme(
//         shape: PinCodeFieldShape.box,
//         borderRadius: BorderRadius.circular(12),
//         fieldHeight: 64,
//         fieldWidth: 64,
//         activeColor: AppColors.secondary,
//         activeFillColor: AppColors.secondary,
//         inactiveColor: AppColors.grey.withOpacity(0.1),
//         inactiveFillColor: AppColors.grey.withOpacity(0.5),
//         selectedColor: AppColors.primary,
//         selectedFillColor: AppColors.primary,
//       ),
//       animationDuration: Duration(milliseconds: 300),
//       enableActiveFill: true,
//       onChanged: (value) {},
//       appContext: context,
//     );
//   }
// }
