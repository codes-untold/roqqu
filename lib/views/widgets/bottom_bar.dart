import 'package:flutter/material.dart';
import 'package:roqqu/utils/styles.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      color: const Color(0XFF17181B),
      width: double.infinity,
      child: Column(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.16),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0XFFE9F0FF).withOpacity(0.05)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
                  child: Text(
                    'Open Orders',
                    style: AppStyles.boldText.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Text(
                    'Positions',
                    style: AppStyles.boldText.copyWith(color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  child: Text(
                    'Order History',
                    style: AppStyles.boldText.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
            child: SizedBox(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'No open Orders',
                  style: AppStyles.boldText.copyWith(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                  textAlign: TextAlign.center,
                  style: AppStyles.boldText
                      .copyWith(color: const Color(0XFFA7B1BC)),
                ),
              ],
            ),
          ),
        ))
      ]),
    );
  }
}
