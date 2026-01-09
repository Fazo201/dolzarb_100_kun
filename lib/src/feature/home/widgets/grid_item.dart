import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class _GridItem extends StatefulWidget {
  final _Item it;
  const _GridItem({required this.it});

  @override
  State<_GridItem> createState() => _GridItemState();
}

class _GridItemState extends State<_GridItem> {
  bool showDescription = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.it.description != null) {
                setState(() {
                  showDescription = !showDescription;
                });
              }
            },
            child: Image.asset(
              widget.it.imageUrl,
              height: 112.h,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            widget.it.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.sp,
              color: const Color(0xFF013A92),
              fontWeight: FontWeight.w700,
            ),
          ),

          // 👇 DESCRIPTION (faqat bo‘lsa)
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: showDescription
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                widget.it.description ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[700],
                ),
              ),
            ),
            secondChild: const SizedBox.shrink(),
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
    'Стратегик фаолият билан операцион бошқарувни бир-биридан ажратиш',
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