class Data {
  final String cityName;
  final String cityImage;
  final String cityInfo;

  Data(
      {required this.cityName,
      required this.cityImage,
      required this.cityInfo});
}

List<Data> dataList = [
  Data(
      cityName: "London",
      cityImage:
          "https://img.freepik.com/premium-photo/big-ben-clock-tower-thames-river-london_79295-6837.jpg?w=2000",
      cityInfo:
          "London is the capital and largest city of England and the United Kingdom, with a population of just over 9 million."),
  Data(
      cityName: "Paris",
      cityImage:
          "https://img.freepik.com/premium-photo/seine-paris-with-eiffel-tower-autumn-season-paris-france_73503-527.jpg?w=2000",
      cityInfo:
          "Paris is the capital and most populous city of France, with an estimated population of 2,165,423 residents in 2019 in an area of more than 105 km²."),
  Data(
      cityName: "NewYork",
      cityImage:
          "https://img.freepik.com/premium-photo/sunset-manhattan_110488-1459.jpg?w=2000",
      cityInfo:
          "New York, often called New York City (NYC) to distinguish it from the State of New York, is the most populous city in the United States."),
  Data(
      cityName: "Singapore",
      cityImage:
          "https://img.freepik.com/free-photo/singapore-cityscape-twilight_335224-686.jpg?w=2000&t=st=1663196035~exp=1663196635~hmac=81afdbf47d25cba65ede1566b0ad32794d60cce0930a6c422c96c1f62b75789d",
      cityInfo:
          "Singapore, city-state located at the southern tip of the Malay Peninsula, about 85 miles (137 kilometres) north of the Equator."),
];

List<String> pagesList = [
  'Attraction',
  'Places',
  'Hotels',
];

// ListView.builder(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   itemCount: pagesList.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     return Container(
//                       height: 20,
//                       color: Colors.red.shade800,
//                       child: Center(
//                         child: Text(pagesList[index]),
//                       ),
//                     );
//                   }),
