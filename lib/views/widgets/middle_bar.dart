import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqqu/controller/app_controller.dart';
import 'package:roqqu/utils/styles.dart';
import 'package:candlesticks/candlesticks.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../utils/constants.dart';

enum TabSelection { charts, orderBook, recentTrades }

class MiddleBar extends StatefulWidget {
  const MiddleBar(this.candles, this.channel, {super.key});
  final List<Candle> candles;
  final WebSocketChannel channel;

  @override
  State<MiddleBar> createState() => _MiddleBarState();
}

class _MiddleBarState extends State<MiddleBar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<AppController>(
      builder: (_, appController, __) {
        return Container(
          color: const Color(0XFF17181B),
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                  color: const Color(0XFF1C2127),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0XFF262932))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      appController.switchTab(TabSelection.charts);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appController.currentTabSelection ==
                                  TabSelection.charts
                              ? const Color(0XFFE9F0FF).withOpacity(0.05)
                              : Colors.transparent),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Text(
                        'Charts',
                        style: AppStyles.boldText.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      appController.switchTab(TabSelection.orderBook);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appController.currentTabSelection ==
                                  TabSelection.orderBook
                              ? const Color(0XFFE9F0FF).withOpacity(0.05)
                              : Colors.transparent),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Text(
                        'Order Book',
                        style: AppStyles.boldText.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      appController.switchTab(TabSelection.recentTrades);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: appController.currentTabSelection ==
                                  TabSelection.recentTrades
                              ? const Color(0XFFE9F0FF).withOpacity(0.05)
                              : Colors.transparent),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Text(
                        'Recent Trades',
                        style: AppStyles.boldText.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            toggle(appController.currentTabSelection, size)
          ]),
        );
      },
    );
  }

  Widget toggle(TabSelection selection, Size size) {
    switch (selection) {
      case TabSelection.charts:
        return chartWidget(size);
      case TabSelection.orderBook:
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: orderBookWidget(),
        );
      case TabSelection.recentTrades:
        return SizedBox(
          height: size.height * 0.4,
          child: Center(
            child: Text(
              'No Recent Trades',
              style: AppStyles.boldText.copyWith(color: Colors.white),
            ),
          ),
        );
    }
  }

  Widget chartWidget(Size size) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Consumer<AppController>(
            builder: (_, appController, __) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time',
                      style: AppStyles.mediumText
                          .copyWith(color: const Color(0XFFA7B1BC)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    customTimeChip('1H', appController),
                    const SizedBox(
                      width: 10,
                    ),
                    customTimeChip('2H', appController),
                    const SizedBox(
                      width: 10,
                    ),
                    customTimeChip('4H', appController),
                    const SizedBox(
                      width: 10,
                    ),
                    customTimeChip('1D', appController),
                    const SizedBox(
                      width: 10,
                    ),
                    customTimeChip('1W', appController),
                    const SizedBox(
                      width: 10,
                    ),
                    customTimeChip('1M', appController),
                    const SizedBox(
                      width: 10,
                    ),
                    Image.asset(
                      "assets/icons/candle_chart.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Fx Indicators',
                      style: AppStyles.mediumText
                          .copyWith(color: const Color(0XFFA7B1BC)),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          height: 0,
          color: Color(0XFFA7B1BC),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: size.height * 0.4,
          child: Candlesticks(
            candles: widget.candles,
          ),
        ),
      ],
    );
  }

  Widget orderBookWidget() {
    return Consumer<AppController>(
      builder: (_, appController, __) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    multiColorTile(const Color(0XFF353945)),
                    const SizedBox(
                      width: 5,
                    ),
                    multiColorTile(Colors.transparent),
                    const SizedBox(
                      width: 5,
                    ),
                    multiColorTile(Colors.transparent)
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: const Color(0XFF353945),
                      borderRadius: BorderRadius.circular(8)),
                  child: Row(
                    children: [
                      Text(
                        '10',
                        style: AppStyles.boldText.copyWith(color: Colors.white),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0XFF777190),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: AppStyles.boldText.copyWith(
                          color: const Color(0XFFA7B1BC), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'USDT',
                      style: AppStyles.boldText.copyWith(
                          color: const Color(0XFFA7B1BC), fontSize: 12),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Amounts',
                      style: AppStyles.boldText.copyWith(
                          color: const Color(0XFFA7B1BC), fontSize: 12),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'BTC',
                      style: AppStyles.boldText.copyWith(
                          color: const Color(0XFFA7B1BC), fontSize: 12),
                    )
                  ],
                ),
                Text(
                  'Total',
                  style: AppStyles.boldText
                      .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(
                  appController.orderBookData!.asks!.length > 5
                      ? 5
                      : appController.orderBookData!.asks!.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              double.parse(appController
                                      .orderBookData!.asks![index]![0]!
                                      .toString())
                                  .toInt()
                                  .toString(),
                              style: AppStyles.boldText
                                  .copyWith(color: const Color(0XFFFF6838)),
                            ),
                            Text(
                              double.parse(appController
                                      .orderBookData!.asks![index]![1]!
                                      .toString())
                                  .toStringAsFixed(3),
                              style: AppStyles.boldText
                                  .copyWith(color: Colors.white),
                            ),
                            Text('367829',
                                style: AppStyles.boldText
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '36,641',
                  style: AppStyles.boldText
                      .copyWith(color: const Color(0XFF25C26E)),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_upward,
                  color: Color(0XFF25C26E),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '36,641',
                  style: AppStyles.boldText.copyWith(color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(
                  appController.orderBookData!.asks!.length > 5
                      ? 5
                      : appController.orderBookData!.asks!.length,
                  (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              double.parse(appController
                                      .orderBookData!.asks![index]![0]!
                                      .toString())
                                  .toInt()
                                  .toString(),
                              style: AppStyles.boldText
                                  .copyWith(color: const Color(0XFFFF6838)),
                            ),
                            Text(
                              double.parse(appController
                                      .orderBookData!.asks![index]![1]!
                                      .toString())
                                  .toStringAsFixed(3),
                              style: AppStyles.boldText
                                  .copyWith(color: Colors.white),
                            ),
                            Text('367829',
                                style: AppStyles.boldText
                                    .copyWith(color: Colors.white)),
                          ],
                        ),
                      )),
            ),
          ],
        );
      },
    );
  }

  Widget multiColorTile(Color bg) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: bg,
      ),
      width: 25,
      height: 25,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Container(
          width: 15,
          height: 2,
          decoration: const BoxDecoration(color: Color(0XFFFF3868)),
        ),
        Container(
          width: 15,
          height: 2,
          decoration: const BoxDecoration(color: Color(0XFFB1B5C3)),
        ),
        Container(
          width: 15,
          height: 2,
          decoration: const BoxDecoration(color: Color(0XFF25C26E)),
        ),
      ]),
    );
  }

  Widget customTimeChip(String text, AppController controller) {
    return InkWell(
      onTap: () {
        widget.channel.sink.add(
            '{"method":"UNSUBSCRIBE","params":["${controller.selectedTradingpair}@kline_${controller.selectedDuration.toLowerCase()}"],"id":$timeStamp}');
        controller.updateDuration(text);
        widget.channel.sink.add(
            '{"method":"SUBSCRIBE","params":["${controller.selectedTradingpair}@kline_${controller.selectedDuration.toLowerCase()}"],"id":$timeStamp}');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
            color: controller.selectedDuration == text
                ? const Color(0XFF555C63)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16)),
        child: Text(
          text,
          style: AppStyles.mediumText.copyWith(color: const Color(0XFFA7B1BC)),
        ),
      ),
    );
  }
}
