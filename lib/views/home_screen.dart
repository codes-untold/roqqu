import 'dart:convert';

import 'package:candlesticks/candlesticks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roqqu/controller/app_controller.dart';
import 'package:roqqu/utils/constants.dart';
import 'package:roqqu/utils/styles.dart';
import 'package:roqqu/views/widgets/bottom_bar.dart';
import 'package:roqqu/views/widgets/buy_sell_modal.dart';
import 'package:roqqu/views/widgets/middle_bar.dart';
import 'package:roqqu/views/widgets/top_bar.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TabSelection currentTabSelection = TabSelection.charts;
  late WebSocketChannel channel;
  bool isConnected = false;
  String selectedDuration = '1m';

  @override
  void initState() {
    super.initState();
    channel = IOWebSocketChannel.connect('wss://stream.binance.com:9443/ws');
    AppController appController = Provider.of(context, listen: false);
    appController.fetchCandles().then((value) {
      connectToWebSocket();
    });
  }

  @override
  void dispose() {
    channel.sink.close();
    super.dispose();
  }

  void connectToWebSocket() {
    AppController appController = Provider.of(context, listen: false);

    channel.sink.add(candleStickDefaultSubscriptionMessage);
    channel.sink.add(orderBookDefaultSubscriptionMessage);

    channel.stream.listen(
      (message) {
        // Handle received messages
        Map<String, dynamic> map = jsonDecode(message);

        if (map['e'] == null) {
          return;
        }
        if (map['e'] == 'depthUpdate') {
          appController.updateOrderBook(map);
        }
        if (map['e'] == 'kline') {
          appController.updateCandleList(map);
        }
      },
      onDone: () {},
      onError: (error) {},
      cancelOnError:
          true, // Automatically cancel the stream subscription on error
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: const Color(0XFF262932),
        appBar: AppBar(
          backgroundColor: const Color(0XFF17181B),
          leadingWidth: size.width * 0.3,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Image.asset(
                  "assets/icons/logo_mark.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'Sisyphus',
                  style: AppStyles.boldText.copyWith(color: Colors.white),
                )
              ],
            ),
          ),
          actions: [
            Image.asset(
              "assets/icons/avatar.png",
              width: 25,
            ),
            const SizedBox(
              width: 12,
            ),
            Image.asset(
              "assets/icons/globe.png",
              width: 25,
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/icons/sort.png",
                width: 25,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  TopBar(channel),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<AppController>(builder: (_, appController, __) {
                    return MiddleBar(appController.candles, channel);
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: size.height * 0.3, child: const BottomBar()),
                ]),
              ),
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    isScrollControlled: true,
                    context: context,
                    builder: (ctx) {
                      return SizedBox(
                          height: size.height * 0.7,
                          child: const BuySellModal());
                    });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                width: double.infinity,
                child: Row(children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                        color: const Color(0XFF25C26E),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text(
                        'Buy',
                        style: AppStyles.boldText.copyWith(color: Colors.white),
                      ),
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          isScrollControlled: true,
                          context: context,
                          builder: (ctx) {
                            return SizedBox(
                                height: size.height * 0.7,
                                child: const BuySellModal());
                          });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: const Color(0XFFFF554A),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: Text(
                          'Sell',
                          style:
                              AppStyles.boldText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  )),
                ]),
              ),
            )
          ],
        ));
  }
}
