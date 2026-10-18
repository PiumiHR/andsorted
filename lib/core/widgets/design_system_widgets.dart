// import 'package:flutter/material.dart';
//
// import '../../app/theme/app_theme.dart';
//
// class AppPrimaryButton extends StatelessWidget {
//   const AppPrimaryButton({
//     required this.label,
//     required this.onPressed,
//     super.key,
//   });
//
//   final String label;
//   final VoidCallback? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return FilledButton(onPressed: onPressed, child: Text(label));
//   }
// }
//
// class AppSecondaryButton extends StatelessWidget {
//   const AppSecondaryButton({
//     required this.label,
//     required this.onPressed,
//     super.key,
//   });
//
//   final String label;
//   final VoidCallback? onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return OutlinedButton(onPressed: onPressed, child: Text(label));
//   }
// }
//
// class AppSectionHeading extends StatelessWidget {
//   const AppSectionHeading({required this.title, this.action, super.key});
//
//   final String title;
//   final Widget? action;
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Text(title, style: Theme.of(context).textTheme.titleLarge),
//         ),
//         if (action != null) action!,
//       ],
//     );
//   }
// }
//
// class AppEmptyState extends StatelessWidget {
//   const AppEmptyState({
//     required this.title,
//     required this.message,
//     this.icon,
//     super.key,
//   });
//
//   final String title;
//   final String message;
//   final IconData? icon;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(AppSpacing.page),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(
//               icon ?? Icons.inbox_outlined,
//               size: AppDimensions.iconLarge,
//               color: AppColors.accent,
//             ),
//             const SizedBox(height: AppSpacing.md),
//             Text(title, style: Theme.of(context).textTheme.titleLarge),
//             const SizedBox(height: AppSpacing.xs),
//             Text(
//               message,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class AppLoadingState extends StatelessWidget {
//   const AppLoadingState({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Center(child: CircularProgressIndicator());
//   }
// }
//
// class AppErrorState extends StatelessWidget {
//   const AppErrorState({required this.message, this.onRetry, super.key});
//
//   final String message;
//   final VoidCallback? onRetry;
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(AppSpacing.page),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Icon(
//               Icons.error_outline,
//               size: AppDimensions.iconLarge,
//               color: Colors.redAccent,
//             ),
//             const SizedBox(height: AppSpacing.md),
//             Text(
//               message,
//               textAlign: TextAlign.center,
//               style: Theme.of(context).textTheme.bodyMedium,
//             ),
//             if (onRetry != null) ...[
//               const SizedBox(height: AppSpacing.md),
//               AppSecondaryButton(label: 'Try again', onPressed: onRetry),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
