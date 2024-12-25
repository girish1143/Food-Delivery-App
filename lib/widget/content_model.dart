class UnboardingContent {
  String image;
  String title;
  String description;

  UnboardingContent({
    required this.description,
    required this.image,
    required this.title,
  });
}

List<UnboardingContent> contents = [
  UnboardingContent(
    description: 'Pick your food from menu\n     More than 35 times',
    image: "images/onboard.png",
    title: 'Select from Our\n     Best Menu'
  ),
  UnboardingContent(description: 'You can pay on delivery and\n Card payment is available',
      image: "images/cash-on.png",
      title: 'Easy and online payment'),
  UnboardingContent(description: 'Deliver your food at your\n     Doorstep',
      image: "images/food-del.jpg",
      title: 'Quick Delivery at your Doorstep'),
];
