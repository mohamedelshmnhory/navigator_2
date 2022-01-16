import 'package:beautyapp/shared/components/components.dart';
import 'package:beautyapp/shared/components/constants.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Text(
          //   'البحث',
          //   style: Theme.of(context).textTheme.headline5,
          // ),
          const SizedBox(height: 15),
          defaultFormField(
            controller: searchController,
            inputAction: TextInputAction.search,
            type: TextInputType.text,
            direction: TextDirection.ltr,
            onSubmit: (String? value) {

            },
            validate: (String? value) {
              if (value!.isEmpty) {
                return emptyError;
              }
            },
            label: 'ما الذي تبحث عنه',
            prefix: Icons.search,
          ),
        ],
      ),
    );
  }
}
