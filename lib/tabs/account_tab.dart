import 'package:flutter/material.dart';
import 'package:onlib/components/loading_widget.dart';
import 'package:onlib/main.dart';
import 'package:onlib/models/user_model.dart';
import 'package:onlib/services/prefs.dart';

class AccountTab extends StatefulWidget {
  const AccountTab({super.key});

  @override
  State<AccountTab> createState() => _AccountTabState();
}

class _AccountTabState extends State<AccountTab> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Prefs.getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) return const LoadingWidget();

        User user = snapshot.data!;

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        'Tahrirlash',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  child: Image.network(user.avatar),
                ),
                Text(user.firstName),
                Text(user.lastName),
                Text(user.email),
              ],
            ),
          ),
        );
      },
    );
  }

  logout() {
    Prefs.deleteToken();
    Prefs.deleteUser();

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const Init(),
        ),
        (route) => false);
  }
}
