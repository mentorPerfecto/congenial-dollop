import 'package:accessment/src/components.dart';
import 'package:accessment/src/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../view_model/home_view_model.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  // @override
  // void initState() {
  //
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    ref.watch(homeViewModel).fetchSymbols();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ImageView.svg(AppImages.icLogo,
            color: Theme.of(context).iconTheme.color, fit: BoxFit.fitWidth),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: const ImageView.asset(AppImages.avatar,
                  height: 32, width: 32)),
          IconButton(
              onPressed: () {},
              splashRadius: 20,
              icon: const ImageView.svg(AppImages.icGlobe,
                  height: 24, width: 24)),
          IconButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => Dialog(
                      alignment: Alignment.topRight,
                      insetPadding: const EdgeInsets.only(
                          left: 120.0, top: 24.0, right: 24.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: BorderSide(
                              color: Theme.of(context).colorScheme.secondary,
                              width: 1)), //this right here
                      child: const Menu())),
              splashRadius: 20,
              icon:
                  const ImageView.svg(AppImages.icMenu, height: 32, width: 32)),
          const SizedBox(width: 15.0)
        ],
      ),
      body: ListView(
        children: const [
          SummaryCard(),
          MarketBoard(),
          TradingBoard(),
          ButtonsCard()
        ],
      ),
    );
  }
}

class Menu extends ConsumerStatefulWidget {
  const Menu({super.key});

  @override
  ConsumerState<Menu> createState() => _MenuState();
}

class _MenuState extends ConsumerState<Menu> {
  final _options = ['Exchange', 'Wallet', 'Roqqu Hub'];
  String _selectedOption = 'Wallet';

  @override
  Widget build(BuildContext context) {
    var themeProvider = ref.watch(themeViewModel);
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          children: List.generate(
              _options.length,
              (index) => ListTile(
                    dense: true,
                    selected: _selectedOption == _options[index],
                    selectedColor: Theme.of(context).textTheme.bodyLarge!.color,
                    selectedTileColor:
                        Theme.of(context).colorScheme.secondary.withOpacity(.5),
                    title: Text(_options[index],
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16)),
                    onTap: () => {
                      setState(() => _selectedOption = _options[index]),
                      Navigator.of(context).pop()
                    },
                  )),
        ),
        ListenableBuilder(
          listenable: themeProvider,
          builder: (BuildContext context, Widget? child) {
            final themeMode = themeProvider.themeMode;
            return ListTile(
              dense: true,
              title: const Text('Dark Mode',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
              trailing: Switch(
                value: themeMode == ThemeMode.dark,
                onChanged: (value) {
                  if (value) {
                    themeProvider.setThemeMode(ThemeMode.dark);
                    return;
                  }
                  themeProvider.setThemeMode(ThemeMode.light);
                },
              ),
            );
          },
        ),
        ListTile(
          dense: true,
          title: const Text('Log out',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16)),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    );
  }
}
