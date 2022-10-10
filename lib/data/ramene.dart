class Ramen {
  final String image, name;
  final int id, price;

  Ramen({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });
}

List<Ramen> ramens = [
  Ramen(
      id: 1,
      name: "Kurumen ramen",
      price: 12000,
      image:
          "https://cdn.idntimes.com/content-images/post/20190909/66481903-148814289516703-3497657335562202341-n-ab8b60f1a863c295dac426e4e8fe07d6.jpg"),
  Ramen(
    id: 2,
    name: "Hakata ramen",
    price: 15000,
    image:
        "https://cdn.idntimes.com/content-images/post/20190909/67404381-962941597412954-5118162789297492695-n-bfb238c16ff27cf6a9accea8a8b87687.jpg",
  ),
  Ramen(
    id: 3,
    name: "Sapporo miso",
    price: 13000,
    image:
        "https://cdn.idntimes.com/content-images/post/20190909/61452437-199653791001162-6486085982101462217-n-c47ddbbfbb9ac34815b2b3eff01e282f.jpg",
  ),
  Ramen(
    id: 4,
    name: "Kitakata ramen",
    price: 15000,
    image:
        "https://cdn.idntimes.com/content-images/post/20190909/68742059-1389948647822540-3809182602776239559-n-6259e0cd06db9389eaaf48bb7c189256.jpg",
  ),
  Ramen(
    id: 5,
    name: "Hakodate ramen",
    price: 14000,
    image:
        "https://cdn.idntimes.com/content-images/post/20190909/47694389-1260203687463963-6214274597890433861-n-35626399543989bb7948de5de28006be.jpg",
  ),
  Ramen(
    id: 6,
    name: "Wakayama ramen",
    price: 13000,
    image:
        "https://cdn.idntimes.com/content-images/post/20190909/47583095-297631120898344-2875903096440542699-n-b33afc1241b85ff76a5610e6ed494841.jpg",
  )
];
