import 'package:c3/sharks/app/icon_broken.dart';
import 'package:flutter/material.dart';

class FreelanceView extends StatefulWidget {
  const FreelanceView({super.key});

  @override
  State<FreelanceView> createState() => _FreelanceViewState();
}

class _FreelanceViewState extends State<FreelanceView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              _searchBar(),
              _popUpFilterMenu(),
            ],
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, item) {
                return const FreelanceCard(
                  title: 'Freelance Title',
                  subtitle: 'Freelance Subtitle',
                  description: 'Freelance Description',
                  icon: IconBroken.profile,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  _searchBar() {
    return const Expanded(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          contentPadding: EdgeInsets.all(10.0),
          prefixIcon: Icon(IconBroken.search),
          hintText: 'Search',
        ),
      ),
    );
  }

  List filters = [
    {
      'title': 'Freelance',
      'isSelected': false,
    },
    {
      'title': 'Full Time',
      'isSelected': true,
    },
    {
      'title': 'Part Time',
      'isSelected': false,
    },
    {
      'title': 'Internship',
      'isSelected': false,
    },
    {
      'title': 'All',
      'isSelected': false,
    },
    {
      'title': 'Internship',
      'isSelected': false,
    },
    {
      'title': 'Mobile App',
      'isSelected': false,
    },
    {
      'title': 'Web App',
      'isSelected': false,
    },
  ];

  _popUpFilterMenu() {
    return PopupMenuButton<String>(
      icon: const Icon(IconBroken.filter),
      onSelected: (v) {
        setState(() {
          filters[int.parse(v)]['isSelected'] =
              !filters[int.parse(v)]['isSelected'];
        });
      },
      itemBuilder: (context) {
        return List.generate(
          filters.length,
          (index) => PopupMenuItem<String>(
            value: '$index',
            child: CheckboxListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: filters[index]['isSelected'],
              title: Text(
                filters[index]['title'],
              ),
              onChanged: (v) {
                setState(() {
                  filters[index]['isSelected'] = v;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class FreelanceCard extends StatelessWidget {
  const FreelanceCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.icon});

  final String title;
  final String subtitle;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Icon(
                  IconBroken.moreSquare,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: 15.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
