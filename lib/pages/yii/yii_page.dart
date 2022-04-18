import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/freezed/user_state.dart';
import 'data/models/user.dart';
import 'domain/begin_provider.dart';

//----------------------------------------------------------------

class YiiPage extends ConsumerWidget {
  const YiiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 一開始先請求資料
    ref.read(beginChangeProvider).getUser(Random().nextInt(10));
    ref.read(beginChangeProvider).getUser2(Random().nextInt(10));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Begin'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const ChangeNotifierConsumer(),
            const ChangeNotifierConsumer2(),
            const StateNotifierConsumer(),
            const FutureConsumer(),
          ],
        ),
      ),
    );
  }
}

class ChangeNotifierConsumer extends StatelessWidget {
  const ChangeNotifierConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(
          builder: (context, ref, _) {
            User? user = ref.watch(beginChangeProvider).user;
            return user == null ? const Text('error') : Text("${user.data.toJson()}");
          },
        ),
        Consumer(builder: (context, ref, _) {
          return ElevatedButton(
            onPressed: () {
              ref.read(beginChangeProvider).getUser(Random().nextInt(10));
            },
            child: const Text('Get user data'),
          );
        }),
      ],
    );
  }
}

class ChangeNotifierConsumer2 extends StatelessWidget {
  const ChangeNotifierConsumer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(
          builder: (context, ref, _) {
            AsyncValue<User?> asyncValue = ref.watch(beginChangeProvider).user2;
            return asyncValue.when(
              data: (user) {
                return Text("${user?.data.toJson()}");
              },
              error: (o, st) {
                return const Text('error');
              },
              loading: () => const CircularProgressIndicator(),
            );
          },
        ),
        Consumer(builder: (context, ref, _) {
          return ElevatedButton(
            onPressed: () {
              ref.read(beginChangeProvider).getUser2(Random().nextInt(10));
            },
            child: const Text('Get user data'),
          );
        }),
      ],
    );
  }
}

class StateNotifierConsumer extends StatelessWidget {
  const StateNotifierConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(
          builder: (context, ref, _) {
            final UserState state = ref.watch(user3Provider);
            return state.when(
              initial: () => const Text('initial'),
              loading: () => const CircularProgressIndicator(),
              data: (user) => Text("${user.data.toJson()}"),
              error: (msg) => Text(msg),
            );
          },
        ),
        Consumer(builder: (context, ref, _) {
          return ElevatedButton(
            onPressed: () {
              ref.read(user3Provider.notifier).getUser(Random().nextInt(10));
            },
            child: const Text('Get user data'),
          );
        }),
      ],
    );
  }
}

class FutureConsumer extends StatelessWidget {
  const FutureConsumer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final AsyncValue<User?> asyncValue = ref.watch(user4Provider);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            asyncValue.when(
              data: (user) {
                return Text("${user?.data.toJson()}");
              },
              error: (o, st) {
                return const Text('error');
              },
              loading: () => const CircularProgressIndicator(),
            ),
            ElevatedButton(
              onPressed: () {
                ref.refresh(user4Provider);
              },
              child: const Text('Get user data'),
            ),
          ],
        );
      },
    );
  }
}
