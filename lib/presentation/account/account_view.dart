import 'package:e_commerce_app/others/bottom_navigation.dart';
import 'package:e_commerce_app/data/services/shared_preference.dart';
import 'package:e_commerce_app/core/utils/alerts_and_navigators.dart';
import 'package:e_commerce_app/core/utils/colors.dart';
import 'package:e_commerce_app/core/utils/constants.dart';
import 'package:e_commerce_app/presentation/account/widget/header_widget.dart';
import 'package:e_commerce_app/presentation/user_sign_in/user_signin_page.dart';
import 'package:e_commerce_app/widgets/account_row.dart';
import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: HeaderWidget()),
            const Divider(
              color: Colors.black26,
              height: 1,
            ),
            AccountRow(
              title: "Orders",
              icon: "assets/img/a_order.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "My Details",
              icon: "assets/img/a_my_detail.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "Delivery Address",
              icon: "assets/img/a_delivery_address.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "Payment Methods",
              icon: "assets/img/paymenth_methods.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "Promo Code",
              icon: "assets/img/a_promocode.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "Notifications",
              icon: "assets/img/a_noitification.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "Help",
              icon: "assets/img/a_help.png",
              onPressed: () {},
            ),
            AccountRow(
              title: "About",
              icon: "assets/img/a_about.png",
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      logOut(context);
                    },
                    height: 60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19)),
                    minWidth: double.maxFinite,
                    elevation: 0.1,
                    color: const Color(0xffF2F3F2),
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Log Out",
                              style: TextStyle(
                                  color: Appcolor.primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Image.asset(
                            "assets/img/logout.png",
                            width: 20,
                            height: 20,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

// LogOut function
  Future<void> logOut(BuildContext context) async {
    final result = await showDialog(
      context: context,
      builder: (context) => CustomAlertDialog(
        title: 'Comeback Soon!',
        description: 'Are you sure, you want \nto logout',
        popBtnText: 'Cancel',
        actionBtnTxt: 'Logout',
        onTap: () async {
          Navigator.pop(context, true); // Close dialog with a result
        },
      ),
    );

    if (result == true) {
      // Perform logout actions
      await UserAuthStatus.saveUserStatus(false); // Save logout state
      indexChangeNotifier.value = 0; // Reset navigation index if needed
      await nextScreenRemoveUntil(
        // ignore: use_build_context_synchronously
        context,
        const UserSignInPage(), // Navigate to sign-in page
      );
    }
  }
}
