// screens/gift_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/gift_provider.dart';
import '../models/gift.dart';
import 'gift_details_screen.dart';

class GiftListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final giftProvider = Provider.of<GiftProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Gift List')),
      body: ListView.builder(
        itemCount: giftProvider.gifts.length,
        itemBuilder: (ctx, index) {
          final gift = giftProvider.gifts[index];
          return ListTile(
            title: Text(gift.name),
            subtitle: Text(gift.status),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                giftProvider.deleteGift(gift.id);
              },
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GiftDetailScreen(gift: gift),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => GiftDetailScreen()),
          );
        },
      ),
    );
  }
}
