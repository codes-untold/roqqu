import 'package:flutter/material.dart';
import 'package:roqqu/utils/styles.dart';

class BuySellModal extends StatelessWidget {
  const BuySellModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0XFF262932),
      ),
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            //  margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.16),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0XFF25C26E)),
                        color: const Color(0XFFE9F0FF).withOpacity(0.05),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 6),
                      child: Center(
                        child: Text(
                          'Buy',
                          style:
                              AppStyles.boldText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Center(
                        child: Text(
                          'Sell',
                          style:
                              AppStyles.boldText.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                      color: const Color(0XFF353945),
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    'Limit',
                    style: AppStyles.boldText
                        .copyWith(color: Colors.white, fontSize: 12),
                  )),
              Text(
                'Market',
                style: AppStyles.boldText
                    .copyWith(color: const Color(0xffA7B1BC), fontSize: 12),
              ),
              Text(
                'Stop Limit',
                style: AppStyles.boldText
                    .copyWith(color: const Color(0xffA7B1BC), fontSize: 12),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          customBar('Limit price', '0.00 USD'),
          const SizedBox(
            height: 20,
          ),
          customBar('Amount', '0.00 USD'),
          const SizedBox(
            height: 20,
          ),
          customBar('Type', 'Good till Cancelled'),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 20, height: 20),
                  child: Checkbox(
                      fillColor:
                          const MaterialStatePropertyAll(Color(0XFF1C2127)),
                      side: const BorderSide(
                          width: 0.5, color: Color(0XFF373B3F)),
                      value: false,
                      onChanged: (value) {})),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Post only',
                style: AppStyles.mediumText
                    .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              const Icon(
                Icons.info_outline_rounded,
                color: Color(0XFFA7B1BC),
                size: 15,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppStyles.mediumText
                    .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
              ),
              Text(
                '0.00',
                style: AppStyles.mediumText
                    .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color(0XFF483BEB),
                Color(0XFF7847E1),
                Color(0XFFDD568D)
              ]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Buy BTC',
                style: AppStyles.boldText.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 0,
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
                    'Total Account Value',
                    style: AppStyles.mediumText
                        .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '0.00',
                    style: AppStyles.extraBoldText
                        .copyWith(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'NGN',
                    style: AppStyles.mediumText
                        .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 15,
                    color: Color(0XFFA7B1BC),
                  )
                ],
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
                    'Open Orders',
                    style: AppStyles.mediumText
                        .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '0.00',
                    style: AppStyles.extraBoldText
                        .copyWith(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available',
                    style: AppStyles.mediumText
                        .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
                  ),
                  Text(
                    '0.00',
                    style: AppStyles.extraBoldText
                        .copyWith(color: Colors.white, fontSize: 12),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0XFF2764FF)),
            child: Text(
              'Deposit',
              style: AppStyles.boldText.copyWith(color: Colors.white),
            ),
          )
        ]),
      ),
    );
  }

  Widget customBar(String text1, String text2) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
          border: Border.all(color: const Color(0XFF373B3F)),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            Text(
              text1,
              style: AppStyles.mediumText
                  .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.info_outline_rounded,
              color: Color(0XFFA7B1BC),
              size: 15,
            )
          ]),
          Text(
            text2,
            style: AppStyles.mediumText
                .copyWith(color: const Color(0XFFA7B1BC), fontSize: 12),
          )
        ],
      ),
    );
  }
}
