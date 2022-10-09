


class Locations{
  final String text;
  final String timing;
  final int temperature;
  final String weather;
  final String imgUrl;

  Locations({required this.text, required this.timing, required this.temperature, required this.weather, required this.imgUrl});

}

final locations = [
  Locations(text: "casa", timing: "12:43", temperature: 23, weather: "Cloudy", imgUrl: "assets/images/casa.jpg"),
  Locations(text: "eddakhla", timing: "14:43", temperature: 43, weather: "Sunny", imgUrl: "assets/images/dakhla.jpg"),
];