import 'package:flutter/material.dart';

class NotificationRouterService {
  static router(Map<String, dynamic> data, BuildContext context) async {
    if (data["type"].toLowerCase() == "offer") {
      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => AcceptDealOfferSummaryScreen(
      //               data: AcceptOfferData(offerId: data["id"], isOwner: false),
      //             )));
      return;
    }

    // Navigator.push(
    //     context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }
}
