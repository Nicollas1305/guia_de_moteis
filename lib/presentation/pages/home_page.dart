import 'package:flutter/material.dart';
import 'package:guia_de_moteis/presentation/widgets/appbar.dart';
import 'package:provider/provider.dart';
import '../providers/motel_provider.dart';
import '../widgets/home_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final motelProvider = Provider.of<MotelProvider>(context, listen: false);
      await motelProvider.loadMotels();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBarWidget(),
      body: HomeBody(),
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 115,
          child: FloatingActionButton.extended(
            elevation: 2,
            onPressed: () {},
            backgroundColor: Colors.white,
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.map_outlined, color: Theme.of(context).primaryColor),
                const SizedBox(width: 7),
                Text(
                  'mapa',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
