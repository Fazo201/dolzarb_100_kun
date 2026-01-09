import 'package:dolzarb_100_kun/src/feature/home/widgets/calendar_count_down.dart';
import 'package:dolzarb_100_kun/src/feature/home/widgets/center_thick_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AlbumView extends StatelessWidget {
  const AlbumView({super.key});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/backround.png',
              width: mq.width,
              height: mq.height,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, left: 16.0, right: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: mq.height * 0.5,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Container(
                          width: mq.width * 0.70,
                          child: Column(
                            spacing: 12.h,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/uzneftgaz.svg',
                                    width: 32.w,
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    'UZBEKNEFTEGAZ',
                                    style: TextStyle(
                                      color: Color(0xFFEE7427),
                                      fontWeight: FontWeight.w900,
                                      fontSize: 26.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text.rich(
                                style: TextStyle(
                                  fontSize: 68.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF00A2DE),
                                ),
                                TextSpan(
                                  children: [
                                    TextSpan(text: 'ДОЛЗАРБ'),
                                    TextSpan(
                                      text: ' 100 ',
                                      style: TextStyle(
                                        color: Color(0xFFEE7427),
                                        fontSize: 98.sp,
                                      ),
                                    ),
                                    TextSpan(text: 'КУНЛИК'),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                '(“ЎЗБЕКНЕФТГАЗ” АЖнинг 22.12.2025 йилдаги 01-10-1/42-сонли Баёни)',
                                style: TextStyle(color: Color(0xFF00A2DE)),
                              ),
                              CenterThickDivider(
                                height: 3.h,
                                color: Colors.white,
                              ),
                              Text(
                                'Стратегик ислоҳотлар ва самарадорлик даври',
                                style: TextStyle(
                                  color: Color(0xFF2B807B),
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              CenterThickDivider(
                                height: 2.h,
                                color: Colors.white,
                              ),
                              Spacer(),
                              Text(
                                'Долзарб 100 кунликнинг устувор йўналишлари',
                                style: TextStyle(
                                  color: Color(0xFF013A92),
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              CenterThickDivider(
                                height: 2.h,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          right: 0,
                          child: Container(
                            height: mq.height * 0.5,
                            child: Center(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.asset(
                                    'assets/images/big.png',
                                    fit: BoxFit.fill,
                                  ),
                                  Center(child: CalendarCountdown()),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),

                  GridView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: _items.length,
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 5,
    childAspectRatio: 1.6,
  ),
  itemBuilder: (context, i) {
    final it = _items[i];

    return GestureDetector(
      onTap: () {
        if (it.description == null) return;

        showGeneralDialog(
          context: context,
          barrierDismissible: true,
          barrierLabel: '',
          transitionDuration: const Duration(milliseconds: 250),
          pageBuilder: (_, __, ___) {
            return _FullScreenDialog(item: it);
          },
          transitionBuilder: (_, anim, __, child) {
            return FadeTransition(
              opacity: anim,
              child: child,
            );
          },
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            Image.asset(it.imageUrl, height: 112.h),
            const SizedBox(height: 4),
            Text(
              it.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.sp,
                color: const Color(0xFF013A92),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  },
)
                
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Item {
  final String imageUrl;
  final String label;
  final String? description;
  _Item(this.imageUrl, this.label, [this.description]);
}

List<_Item> _items = [
  _Item(
    'assets/images/1.png',
    'Стратегик фаолият билан операцион бошқарувни бир-биридан ажратиш',
    """****** бўйича: 

Лойиҳалар рўйхати шакллантирилди; 

Лойиҳанинг техник топшириғи дастлабки версияси ишлаб чиқилди 

Лойиҳа ижрочилари рўйхати шакллантирилди. 

****** бўйича: 

Лойиҳалар рўйхати шакллантирилди; 

Лойиҳанинг техник топшириғи дастлабки версияси ишлаб чиқилди 

Лойиҳа ижрочилари рўйхати шакллантирилди. 
****** бўйича: 

Лойиҳалар рўйхати шакллантирилди; 

Лойиҳанинг техник топшириғи дастлабки версияси ишлаб чиқилди 

Лойиҳа ижрочилари рўйхати шакллантирилди. 

****** бўйича: 

Лойиҳалар рўйхати шакллантирилди; 

Лойиҳанинг техник топшириғи дастлабки версияси ишлаб чиқилди 

Лойиҳа ижрочилари рўйхати шакллантирилди. """,
  ),
  _Item(
    'assets/images/2.png', 
    'Стратегия офисини ташкил этиш',
    'Стратегия офисини ташкил этиш',
  ),
  _Item(
    'assets/images/3.png',
    'Геологик-қидирув ишлари харажатларини мақбуллаштириш',
    'Геологик-қидирув ишлари харажатларини мақбуллаштириш',
  ),
  _Item(
    'assets/images/4.png', 
    'Газни чуқур қайта ишлаш',
    'Газни чуқур қайта ишлаш',
  ),
  _Item(
    'assets/images/5.png', 
    'Кредит юкламасини кескин камайтириш',
    'Кредит юкламасини кескин камайтириш',
  ),
  _Item(
    'assets/images/6.png', 
    'Молиявий шаффофликни тўлиқ таъминлаш',
    'Молиявий шаффофликни тўлиқ таъминлаш',
  ),
  _Item(
    'assets/images/7.png',
    'Кадрлар сиёсати ва самарадорликнинг муҳим кўрсаткичлари',
    'Кадрлар сиёсати ва самарадорликнинг муҳим кўрсаткичлари',
  ),
  _Item(
    'assets/images/8.png',
    'Инвестиция сиёсатида самарадорликнинг устуворлиги',
    'Инвестиция сиёсатида самарадорликнинг устуворлиги',
  ),
  _Item(
    'assets/images/9.png',
    'Рақамлаштириш ва сунъий интеллектдан фойдаланиш',
    'Рақамлаштириш ва сунъий интеллектдан фойдаланиш',
  ),
  _Item(
    'assets/images/10.png', 
    'Қазиб чиқаришда янги ёндашув',
    'Қазиб чиқаришда янги ёндашув',
  ),
];


class _FullScreenDialog extends StatelessWidget {
  final _Item item;
  const _FullScreenDialog({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 16,
              ),
              child: Row(
                children: [
                  if (item.imageUrl.isNotEmpty)
                      Center(
                        child: Image.asset(
                          item.imageUrl,
                          height: 60,
                        ),
                      ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item.label,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 92, 221),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),

            Divider(color: Color(0xFF003177), height: 1),

           
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 48,
                  vertical: 24,
                ),
                child: Text(
                      item.description??"",
                      style: const TextStyle(
                        color: Color.fromARGB(255, 6, 0, 90),
                        fontSize: 16,
                        height: 1.6, 
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
