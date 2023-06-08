import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqqu/controller/app_controller.dart';
import 'package:roqqu/utils/constants.dart';
import 'package:roqqu/utils/styles.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class TopBar extends StatefulWidget {
  TopBar(this.channel, {super.key});
  final WebSocketChannel channel;
  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  final List<PopupMenuItem<String>> _popUpMenuItems = tradingPairs
      .map((e) => PopupMenuItem<String>(
            value: e['value'],
            child: Text(e['symbol']),
          ))
      .toList();

  String selectedTradingPair = "BTC/USDT";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0XFF17181B),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.amber,
                    child: Icon(
                      tradingPairs
                          .where((element) =>
                              element['symbol'] == selectedTradingPair)
                          .first['icon'][0],
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: const Color(0XFFC6DE07),
                    child: Icon(
                      tradingPairs
                          .where((element) =>
                              element['symbol'] == selectedTradingPair)
                          .first['icon'][1],
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Consumer<AppController>(
                builder: (_, appController, __) {
                  return PopupMenuButton(
                    itemBuilder: (context) {
                      return _popUpMenuItems;
                    },
                    onSelected: (value) async {
                      widget.channel.sink.add(
                          '{"method":"UNSUBSCRIBE","params":["${appController.selectedTradingpair.toLowerCase()}@kline_${appController.selectedDuration.toLowerCase()}"],"id":$timeStamp}');

                      await appController.updateTradingPair(value);

                      widget.channel.sink.add(
                          '{"method":"SUBSCRIBE","params":["${appController.selectedTradingpair.toLowerCase()}@kline_${appController.selectedDuration.toLowerCase()}"],"id":$timeStamp}');

                      setState(() {
                        selectedTradingPair = tradingPairs
                            .where((element) => element['value'] == value)
                            .first['symbol'];
                      });
                    },
                    initialValue: 'BTC/USDT',
                    child: Row(
                      children: [
                        Text(
                          selectedTradingPair,
                          style:
                              AppStyles.boldText.copyWith(color: Colors.white),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Image.asset(
                          "assets/icons/arrow_downward.png",
                          width: 10,
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                '\$20,634',
                style:
                    AppStyles.boldText.copyWith(color: const Color(0Xff00C076)),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/icons/clock.png",
                        width: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '24h Change',
                        style: AppStyles.regularText
                            .copyWith(color: const Color(0XFFA7B1BC)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '520.80 +1.25%',
                    style: AppStyles.boldText
                        .copyWith(color: const Color(0Xff00C076)),
                  ),
                ],
              ),
              Container(
                width: 1,
                color: const Color(0XFFE0FAFE),
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        color: Color(0XFFA7B1BC),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '24h High',
                        style: AppStyles.regularText
                            .copyWith(color: const Color(0XFFA7B1BC)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '520.80 +1.25%',
                    style: AppStyles.boldText.copyWith(color: Colors.white),
                  ),
                ],
              ),
              Container(
                width: 1,
                color: const Color(0XFFE0FAFE),
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_downward,
                        color: Color(0XFFA7B1BC),
                        size: 15,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        '24h Low',
                        style: AppStyles.regularText
                            .copyWith(color: const Color(0XFFA7B1BC)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '520.80 +1.25%',
                    style: AppStyles.boldText.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
