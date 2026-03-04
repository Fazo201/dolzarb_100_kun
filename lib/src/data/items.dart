final List<DataItems> dataItems = [
  DataItems(
    id: 'Strategiya',
    imageUrl: 'assets/images/1.png',
    label: 'Strategik faoliyat bilan operatsion boshqaruvni bir-biridan ajratish',
  ),
  DataItems(
    id: 'Ofis',
    imageUrl: 'assets/images/2.png',
    label: 'Strategiya ofisini tashkil etish',
  ),
  DataItems(
    id: 'Gelogiya',
    imageUrl: 'assets/images/3.png',
    label: 'Geologik-qidiruv ishlari xarajatlarini maqbullashtirish',
  ),
  DataItems(
    id: 'Gaz',
    imageUrl: 'assets/images/4.png',
    label: 'Gazni chuqur qayta ishlash',
  ),
  DataItems(
    id: 'Kredit',
    imageUrl: 'assets/images/5.png',
    label: 'Kredit yuklamasini keskin kamaytirish',
  ),
  DataItems(
    id: 'Moliya',
    imageUrl: 'assets/images/6.png',
    label: 'Moliyaviy shaffoflikni to‘liq ta’minlash',
  ),
  DataItems(
    id: 'Kadr',
    imageUrl: 'assets/images/7.png',
    label: 'Kadrlar siyosati va samaradorlikning muhim ko‘rsatkichlari',
  ),
  DataItems(
    id: 'Investitsiya',
    imageUrl: 'assets/images/8.png',
    label: 'Investitsiya siyosatida samaradorlikning ustuvorligi',
  ),
  DataItems(
    id: 'Raqamlashtirish',
    imageUrl: 'assets/images/9.png',
    label: 'Raqamlashtirish va sun’iy intellektdan foydalanish',
  ),
  DataItems(
    id: 'Qazish',
    imageUrl: 'assets/images/10.png',
    label: 'Qazib chiqarishda yangi yondashuv',
  ),
];

class DataItems {
  final String id; 
  final String imageUrl; 
  final String label;

  const DataItems({required this.id, required this.imageUrl, required this.label});
}
