class Data {
  late String cityName;
  late String cityImage;
  late String cityInfo;

  Data({
    required this.cityName,
    required this.cityImage,
    required this.cityInfo,
  });
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
  Data(
      cityName: "Prague",
      cityImage:
          "https://img.freepik.com/free-photo/prague-castle-from-vltava-side_1398-2758.jpg?w=1380&t=st=1663438901~exp=1663439501~hmac=46a6791051889dbe51ee239ae7011a7c7d105a84b06b2a9a79d7d368d18ce953",
      cityInfo:
          "Prague, is the capital and largest city in the Czech Republic, and the historical capital of Bohemia."),
  Data(
      cityName: "Osaka",
      cityImage:
          "https://img.freepik.com/free-photo/cherry-blossoms-castle-osaka-japan_335224-169.jpg?w=1380&t=st=1663438937~exp=1663439537~hmac=8b576589b33fbaa82afb9a8e15efd49d0818d03a8425d5f27871a9380fd2647e",
      cityInfo:
          "Osaka is a large port city and commercial center on the Japanese island of Honshu."),
  Data(
      cityName: "Berlin",
      cityImage:
          "https://img.freepik.com/free-photo/building-with-columns_1160-803.jpg?w=1380&t=st=1663439085~exp=1663439685~hmac=db82c0f1a09750e9b47e63a0f271778f2ed36a8bc3fcfc589dbf9b24859ef2d8",
      cityInfo:
          "Berlin, Germany's capital, dates to the 13th century. Reminders of the city's turbulent 20th-century history include its Holocaust memorial and the Berlin Wall's graffitied remains."),
];
