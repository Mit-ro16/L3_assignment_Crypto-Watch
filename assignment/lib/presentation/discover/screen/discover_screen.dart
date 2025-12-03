import 'package:assignment/core/di/di.dart';
import 'package:assignment/presentation/discover/bloc/discover_bloc.dart';
import 'package:assignment/presentation/discover/bloc/discover_event.dart';
import 'package:assignment/presentation/discover/bloc/discover_state.dart';
import 'package:assignment/presentation/discover/widget/crypto_card.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di<DiscoverBloc>()..add(LoadMarketEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Discover")),
        body: BlocBuilder<DiscoverBloc, DiscoverState>(
          builder: (context, state) {
            if (state is DiscoverLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is DiscoverLoaded) {
              return ListView.builder(
                itemCount: state.coins.length,
                itemBuilder: (_, i) => CryptoCard(coin: state.coins[i]),
              );
            }

            if (state is DiscoverError) {
              return Center(child: Text(state.message));
            }

            return Container();
          },
        ),
      ),
    );
  }
}
