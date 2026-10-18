// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:logging/logging.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../../../entities/base_pages.dart';
//
// part 'home_tabs_provider.g.dart';
//
// final _log = Logger('MainTabConfigurations');
//
// @riverpod
// List<Widget> mainPageBody(Ref ref, List<Widget> navigatorChildren) {
//   final bodyWidgets = [
//     navigatorChildren[0],
//     navigatorChildren[1],
//     navigatorChildren[2],
//   ];
//
//   return bodyWidgets;
// }
//
// @riverpod
// List<BasePages> homeTabs(Ref ref) {
//   final visibleItems = [BasePages.settings];
//
//   _log.finer(() => 'Shown tabs: $visibleItems');
//   return visibleItems;
// }
//
// ///
// /// Router stack is static therefore router index will always translate to the
// /// index of all supported enum. We will resolve the desired enum index to the
// /// activated enum index.
// ///
// @riverpod
// int resolvedRouterCurrentIndex(Ref ref, int routerIndex) {
//   var enumMatchingIndex = BasePages.values[routerIndex];
//   var activeEnums = ref.watch(homeTabsProvider);
//   var resolvedIndex = activeEnums.indexOf(enumMatchingIndex);
//
//   // In a situation where flag turn off happens while being that tab, resolved
//   // index will be -1. Therefore, we will switch to index 0
//   if (resolvedIndex == -1) {
//     _log.warning(
//       'Router tab $enumMatchingIndex is not active; falling back to index 0',
//     );
//   }
//   var indexToReturn = resolvedIndex > -1 ? resolvedIndex : 0;
//   _log.finer('Resolved current index on main stack is $indexToReturn');
//   return indexToReturn;
// }
//
// @riverpod
// class SelectedTab extends _$SelectedTab {
//   @override
//   BasePages? build() => null;
//
//   void set(BasePages tab) {
//     _log.info('Selected home tab: $tab');
//     state = tab;
//   }
// }
