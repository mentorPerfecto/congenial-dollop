import 'package:flutter/material.dart';
import 'package:accessment/view_model/home_view_model.dart';
import 'package:accessment/view/components/text_edit_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TickersModal extends ConsumerStatefulWidget {
  const TickersModal({Key? key}) : super(key: key);

  @override
  ConsumerState<TickersModal> createState() => _SymbolSearchModalState();
}

class _SymbolSearchModalState extends ConsumerState<TickersModal> {
  String symbolSearch = "";
  @override
  Widget build(BuildContext context) {
    var provider = ref.watch(homeViewModel);
    final tickers = provider.tickers
        .where(
            (t) => t.symbol.toLowerCase().contains(symbolSearch.toLowerCase()))
        .toList();
    return Column(
      children: [
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextEditView(
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Icon(Icons.search),
            ),
            hintText: 'Search symbol',
            onChanged: (value) {
              setState(() {
                symbolSearch = value;
              });
            },
          ),
        ),
        Expanded(
          child: ListView.separated(
            itemCount: tickers.length,
            separatorBuilder: (context, index) =>
                Divider(thickness: .2, color: Theme.of(context).shadowColor),
            itemBuilder: (context, index) {
              final e = tickers[index];
              return ListTile(
                dense: true,
                title: Text(e.symbol),
                onTap: () {
                  provider.setTicker(e);
                  Navigator.of(context).pop();
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
