//
import 'dart:math';

import 'package:domain/domain.dart';

Random random = Random();

String randomDummyImg() {
  int imgIndex = random.nextInt(dummyImages.length);

  return dummyImages[imgIndex];
}

String randomDummyImgTitle() {
  int imgIndex = random.nextInt(dummyImages.length);

  return dummyImagesTitle[imgIndex];
}

const dummyImagesTitle = [
  'Colorful',
  'Cyberpunk',
  'Realistic',
  'Fantasy',
  'Anime',
];

const dummyImages = [
  'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg',
  'https://www.befunky.com/images/prismic/8378f663-d028-48f1-87de-fc5f872aa948_hero-photo-to-art-5.jpg',
  'https://t4.ftcdn.net/jpg/04/39/50/13/360_F_439501334_HVygoTnSuPqvQjtwkz26SbYuRA3tnJzv.jpg',
  'https://img.freepik.com/free-photo/one-woman-elegance-colorful-autumn-nature-generative-ai_188544-9733.jpg',
  'https://www.collettivovv.org/wp-content/uploads/2018/07/New-Project-20.png'
];

const dummyGoodImages = [
  'https://images.media.io/images2023/ai-headshot-generator/female-8.png',
  'https://images.media.io/images2023/ai-headshot-generator/female-7.png',
  'https://images.media.io/images2023/ai-headshot-generator/female-6.png',
  'https://images.media.io/images2023/ai-headshot-generator/female-5.png',
];

const dummyBadImages = [
  'https://thesimscatalog.com/sims4/wp-content/uploads/2022/11/p6.jpg',
  'https://thesimscatalog.com/sims4/wp-content/uploads/2022/11/p6.jpg',
  'https://thesimscatalog.com/sims4/wp-content/uploads/2022/11/p6.jpg',
  'https://thesimscatalog.com/sims4/wp-content/uploads/2022/11/p6.jpg',
];

const dummyTextEffect = [
  'https://img.freepik.com/free-vector/planet-venus-word-logo-design_1308-86215.jpg?w=1800&t=st=1713326957~exp=1713327557~hmac=3f3852a1348e37af32dc966f1c17d8207023c9502c466d5994f51b73d8555ad4',
  'https://img.freepik.com/free-vector/tasmanian-tiger-extinction-animal_1308-126630.jpg?w=1480&t=st=1713326999~exp=1713327599~hmac=7607d9a6a0244a4f26cfa42240570bfedba90134a0dd5d4ed6a0d911d7f202be',
  'https://img.freepik.com/premium-photo/finish-3d-word-text_7280-9560.jpg?w=1380',
  'https://img.freepik.com/free-vector/laugh-word-vector-doodle-font-lettering_53876-173220.jpg?t=st=1713327058~exp=1713330658~hmac=e16891086b3013b1c2415c7ebe1b9aa0dd3237bd96dbfcc3c3508f225c78d36c&w=826',
  'https://img.freepik.com/free-vector/planet-venus-word-logo-design_1308-86215.jpg?w=1800&t=st=1713326957~exp=1713327557~hmac=3f3852a1348e37af32dc966f1c17d8207023c9502c466d5994f51b73d8555ad4',
  'https://img.freepik.com/free-vector/tasmanian-tiger-extinction-animal_1308-126630.jpg?w=1480&t=st=1713326999~exp=1713327599~hmac=7607d9a6a0244a4f26cfa42240570bfedba90134a0dd5d4ed6a0d911d7f202be',
  'https://img.freepik.com/premium-photo/finish-3d-word-text_7280-9560.jpg?w=1380',
  'https://img.freepik.com/free-vector/laugh-word-vector-doodle-font-lettering_53876-173220.jpg?t=st=1713327058~exp=1713330658~hmac=e16891086b3013b1c2415c7ebe1b9aa0dd3237bd96dbfcc3c3508f225c78d36c&w=826',
];

const dummyBgColor = [
  '9FE634',
  '9FE634',
  '8FD3DF',
  '94893B',
  '73297A',
  'CE2378',
  '7BA5D9',
  'D1AAE7',
  'ADAF85',
  '3E80D9'
];
const dummyTextColor = [
  'AFA7E2',
  'AFA7E2',
  'CF588B',
  'A350D4',
  '6378E5',
  '1ADA48',
  'D1E577',
  'BE2871',
  'A3A35C',
  '34B166'
];

const AITask promptTask = AITask(
  id: 0,
  data:
      'photo of a ginger woman, in space, futuristic space suit, (freckles:0.8) cute face, sci-fi, dystopian, detailed eyes, blue eyes',
  createdAt: '',
  taskType: AITaskType.promptEnhance,
);

const AITask imageTask = AITask(
  id: 0,
  data:
      'https://image.civitai.com/xG1nkqKTMzGDvpLrqFT7WA/470ce5ae-497e-414f-bd8b-cc1bf67086ef/original=true,quality=90/02501-2802306715.jpeg',
  createdAt: '',
  taskType: AITaskType.inference,
);
