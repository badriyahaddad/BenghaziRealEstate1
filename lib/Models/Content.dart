class UnbordingContent {
  String image;
  String title;
  String description;

  UnbordingContent(
      {required this.image, required this.title, required this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      description: 'Find Your Perfect Home',
      image: 'Assets/images/content3.png',
      title: "Feel Safe"),
  UnbordingContent(
      description: 'Without Worrying about commission ',
      image: 'Assets/images/content1.png',
      title: "Reliability"),
  UnbordingContent(
      description: 'Connected with saller directly',
      image: 'Assets/images/content2.png',
      title: "Be On Bored"),
  // UnbordingContent(
  //     description: 'Increase your Knowledge with our App',
  //     image: 'assets/3.png',
  //     title: "Lorem Ipsum"),
];
