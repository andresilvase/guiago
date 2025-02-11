import 'package:flutter_test/flutter_test.dart';
import 'package:guiago/core/domain/highlight_offer.dart';

void main() {
  group('HighlightOffer', () {
    test('should initialize with the correct values', () {
      // Arrange
      const discountPercentage = 20.0;
      const description = 'Special offer';
      const minPrice = 99.99;
      const imageUrl = 'https://example.com/image.jpg';
      const title = 'Amazing Deal';

      // Act
      final highlightOffer = HighlightOffer(
        discountPercentage: discountPercentage,
        description: description,
        imageUrl: imageUrl,
        minPrice: minPrice,
        title: title,
      );

      // Assert
      expect(highlightOffer.discountPercentage, discountPercentage);
      expect(highlightOffer.description, description);
      expect(highlightOffer.minPrice, minPrice);
      expect(highlightOffer.imageUrl, imageUrl);
      expect(highlightOffer.title, title);
    });
  });
}
