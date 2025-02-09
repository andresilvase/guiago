class HighlightOffer {
  final double discountPercentage;
  final String description;
  final double minPrice;
  final String imageUrl;
  final String title;

  HighlightOffer({
    required this.discountPercentage,
    required this.description,
    required this.imageUrl,
    required this.minPrice,
    required this.title,
  });

  static List<HighlightOffer> list() {
    return List.generate(3, (index) {
      final HighlightOffer offer1 = HighlightOffer(
        discountPercentage: 0.43,
        imageUrl: "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
        description: "nossa senhora de lourdes - aparecida de goiânia",
        minPrice: 81.18,
        title: "mont blanc motel",
      );

      final HighlightOffer offer2 = HighlightOffer(
        discountPercentage: 0.25,
        imageUrl: "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_2.jpg",
        description: "distrito agroindustrial - senador canedo",
        minPrice: 192.27,
        title: "Suíte Marselha Sexy",
      );

      final HighlightOffer offer3 = HighlightOffer(
        discountPercentage: 0.3,
        imageUrl: "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_3.jpg",
        description: "vila brasília - aparecida de goiânia",
        minPrice: 88.91,
        title: "Motel Le Nid",
      );

      return [offer1, offer2, offer3][index];
    });
  }
}
