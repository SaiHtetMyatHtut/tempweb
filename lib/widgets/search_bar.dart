import 'package:better_web_v2/constants/theme_colors.dart';
import 'package:better_web_v2/widgets/user_dialog.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Expanded(child: Search()),
        const SizedBox(width: 20),
        SizedBox(
          width: 100,
          height: 40,
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const UserDialog('New User'),
              );
            },
            child: const Text(
              'New',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ThemeColors.oriange),
            ),
          ),
        ),
        // fix
        // New User
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          height: 40,
          child: TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const UserDialog('New User'),
              );
            },
            child: const Text(
              'New',
              style: TextStyle(color: Colors.white),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ThemeColors.oriange),
            ),
          ),
        )
      ],
    );
  }
}

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: 45,
      decoration: BoxDecoration(
        color: ThemeColors.navyblue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: Icon(
            Icons.search,
            color: Colors.lightBlue,
          ),
          hintText: 'Search User by Name',
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}
