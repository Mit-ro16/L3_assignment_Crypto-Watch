import 'package:flutter/material.dart';
import '../../../domain/entities/crypto_entity.dart';

class CryptoCard extends StatelessWidget {
  final CryptoEntity coin;

  const CryptoCard({super.key, required this.coin});

  @override
  Widget build(BuildContext context) {
    final bool positive = coin.change24 >= 0;

    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(coin.image),
          radius: 24,
        ),
        title: Text(
          coin.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(coin.symbol.toUpperCase()),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "\$${coin.price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              "${coin.change24.toStringAsFixed(2)}%",
              style: TextStyle(
                color: positive ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
