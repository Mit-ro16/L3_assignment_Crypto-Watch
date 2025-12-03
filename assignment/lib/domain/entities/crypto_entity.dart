class CryptoEntity {
  final String id;
  final String symbol;
  final String name;
  final String image;
  final double price;
  final double change24;

  CryptoEntity({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.price,
    required this.change24,
  });
}
