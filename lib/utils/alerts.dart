// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:accessment/src/components.dart';
// import 'package:accessment/utils/enums.dart';
// import 'package:accessment/view_model/trx_view_model.dart';
//
//
// showBottomModalSheet(BuildContext context, {
//   required Widget widget
// }){
//   return showModalBottomSheet(
//
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(21.r), topLeft: Radius.circular(21.r),)),
//     context: context,
//     isScrollControlled: true,
//     builder: (context) {
//       return Container(
//         // height: 227.h,
//         padding: EdgeInsets.symmetric(vertical: 20.h),
//         child: widget
//         // Column(
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: [
//         //     widget
//         //   ],
//         // ),
//       );
//     },
//   );
// }
//
// showLocaleBottomModalSheet(BuildContext context, {
//   required Widget widget
// }){
//   return showModalBottomSheet(
//
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(21.r), topLeft: Radius.circular(21.r),)),
//     context: context,
//     isScrollControlled: true,
//     builder: (context) {
//       return Container(
//         height: 350.h,
//           padding: EdgeInsets.symmetric(vertical: 20.h),
//           child: widget
//         // Column(
//         //   mainAxisSize: MainAxisSize.min,
//         //   children: [
//         //     widget
//         //   ],
//         // ),
//       );
//     },
//   );
// }
//
//
//
// void displayModalNavBar(context, WalletAction walletAction, WidgetRef ref) {
//   showModalBottomSheet(
//       context: context,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
//       ),
//       builder: (BuildContext context) {
//         return WalletActionScreen(walletAction: walletAction,);}).whenComplete(() => ref.watch(trxViewModel).getTransactions());
// }
//
//
