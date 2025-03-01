import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constant/color_manger.dart';
import 'package:rick_and_morty/models/rick_and_morty_model.dart';
import 'package:rick_and_morty/pages/details_character/widget/details_widget.dart';

@RoutePage()
class DetailsCharacterPage extends StatelessWidget {
  const DetailsCharacterPage({super.key, required this.results});
  final Results results;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.grey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              onTap: () => context.router.maybePop(),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),
            expandedHeight: 600,
            pinned: true,
            backgroundColor: ColorManger.grey,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                results.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              background: Image.network(
                results.image!,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                    children: [
                      DetailsWidget(
                        results: results,
                        title: 'iD',
                        value: results.id.toString(),
                        endIndent: 345,
                      ),
                      DetailsWidget(
                        results: results,
                        title: 'Name',
                        value: results.name!,
                        endIndent: 315,
                      ),
                      DetailsWidget(
                        results: results,
                        title: 'Status',
                        value: results.status!,
                        endIndent: 310,
                      ),
                      DetailsWidget(
                        results: results,
                        title: 'Species',
                        value: results.species!,
                        endIndent: 300,
                      ),
                      DetailsWidget(
                        results: results,
                        title: 'Gender',
                        value: results.gender!,
                        endIndent: 305,
                      ),
                      DetailsWidget(
                        results: results,
                        title: 'Location',
                        value: results.location!.name!,
                        endIndent: 295,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
