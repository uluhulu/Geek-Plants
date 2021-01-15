import 'package:flutter/cupertino.dart';
import 'package:geek_plants/data/model/plant.dart';
import 'package:geek_plants/screens/main_screen/main_screen_viewmodel.dart';

class PlantListHeader extends StatelessWidget {
  final List<Plant> plants;

  const PlantListHeader({Key key, this.plants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      floating: true,
      pinned: false,
      delegate: PlantsListHeaderDelegate(plants),
    );
  }
}

class PlantsListHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<Plant> plants;

  PlantsListHeaderDelegate(this.plants);

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 41.0, left: 19),
            child: Text(
              "Мои растения",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 22.0),
          child: Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 11.0, left: 19),
                  child: Text(
                    "${plants?.length ?? 0} растения",
                    style: TextStyle(
                      color: Color.fromRGBO(74, 171, 66, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 18,
                width: 136,
              ),
              _buildSquareIcon(),
              _buildSeparator(),
              _buildRectangleIcon(),
              _buildSeparator(),
              _buildSearchingIcon(),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSquareIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Image.asset(
        "assets/vector/square.png",
        width: 12,
        height: 12,
      ),
    );
  }

  Widget _buildRectangleIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Image.asset(
        "assets/vector/rec.png",
        width: 16,
        height: 12,
      ),
    );
  }

  Widget _buildSearchingIcon() {
    return Padding(
      padding: const EdgeInsets.only(top: 11.0),
      child: Image.asset(
        "assets/vector/search.png",
        width: 12,
        height: 12,
      ),
    );
  }

  Widget _buildSeparator() {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18, top: 10),
      child: Image.asset(
        "assets/vector/separator.png",
        height: 24,
        width: 2,
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 140;

  @override
  // TODO: implement minExtent
  double get minExtent => 140;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
