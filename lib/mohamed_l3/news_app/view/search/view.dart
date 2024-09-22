import 'package:c3/mohamed_l3/news_app/controller/app_ctrl.dart';
import 'package:c3/mohamed_l3/news_app/view/_resources/colors.dart';
import 'package:c3/sharks/app/icon_broken.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../layout/view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
//الزمالك
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<AppController, AppStates>(
          builder: (context, state) {
            final cubit = context.read<AppController>();
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          IconBroken.arrowLeft,
                          color: NewsColors.primary,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: cubit.searchCtrl,
                          onChanged: (v) {
                            cubit.getSearchData();
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            prefixIcon: Icon(IconBroken.search),
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: cubit.resultsOfSearch.isEmpty
                      ? const Center(
                          child: Text(
                            'No results',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : ListView.separated(
                          padding: const EdgeInsets.all(10),
                          itemCount: cubit.resultsOfSearch.length,
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemBuilder: (context, index) {
                            return LayoutItem(cubit.resultsOfSearch[index]);
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
