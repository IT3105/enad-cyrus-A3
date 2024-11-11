// screens/gift_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/gift.dart';
import '../providers/gift_provider.dart';

class GiftDetailScreen extends StatefulWidget {
  final Gift? gift;
  GiftDetailScreen({this.gift});

  @override
  _GiftDetailScreenState createState() => _GiftDetailScreenState();
}

class _GiftDetailScreenState extends State<GiftDetailScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _name;
  late String _status;
  late String _notes;

  @override
  void initState() {
    super.initState();
    _name = widget.gift?.name ?? '';
    _status = widget.gift?.status ?? 'Idea';
    _notes = widget.gift?.notes ?? '';
  }

  void _saveGift() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final giftProvider = Provider.of<GiftProvider>(context, listen: false);

      if (widget.gift != null) {
        final updatedGift = Gift(
          id: widget.gift!.id,
          name: _name,
          status: _status,
          notes: _notes,
        );
        giftProvider.editGift(widget.gift!.id, updatedGift);
      } else {
        final newGift = Gift(
          id: DateTime.now().toString(),
          name: _name,
          status: _status,
          notes: _notes,
        );
        giftProvider.addGift(newGift);
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.gift == null ? 'Add Gift' : 'Edit Gift'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveGift,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Gift Name'),
                onSaved: (value) => _name = value!,
                validator: (value) => value!.isEmpty ? 'Please enter a name' : null,
              ),
              DropdownButtonFormField<String>(
                value: _status,
                items: ['Idea', 'To Buy', 'Bought']
                    .map((status) => DropdownMenuItem(
                  value: status,
                  child: Text(status),
                ))
                    .toList(),
                onChanged: (value) => setState(() => _status = value!),
                decoration: InputDecoration(labelText: 'Status'),
              ),
              TextFormField(
                initialValue: _notes,
                decoration: InputDecoration(labelText: 'Notes'),
                onSaved: (value) => _notes = value!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
