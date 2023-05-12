import 'package:cab_booking/models/cart.dart';
import 'package:cab_booking/models/watch.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/watch_tile.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addWatchToCart(Watch watch) {
    Provider.of<Cart>(context, listen: false).addItemToCart(watch);

    //alert the user , shoe successfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Successfully added!'),
              content: Text('Check your Cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: ((context, value, child) => Column(
              children: [
                // search bar
                Container(
                  padding: EdgeInsets.all(12),
                  margin: EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Search',
                        style: TextStyle(color: Color(0xFFcf2d2d)),
                      ),
                      Icon(
                        Icons.search,
                        color: Color(0xFFcf2d2d),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 25.0,
                  ),
                  child: Text(
                    "The trouble is, you think you have time",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      Text(
                        'Hot Picks 🔥',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFcf2d2d)),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      // value come from consumer
                      // get a watch from shop list
                      Watch watch = value.getWatchList()[index];
                      // Watch watch = Watch(
                      //     name: 'Wave call',
                      //     price: '₹1,799',
                      //     imagePath: 'lib/images/w5.png',
                      //     description: 'cool watch');
                      return WatchTile(
                        watch: watch,
                        onTap: () => addWatchToCart(watch),
                      );
                    }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 25.0, left: 25, right: 25),
                  child: Divider(color: Colors.white),
                )
              ],
            )));
  }
}
// continue 20