import 'package:clean_arhitecture_example_app/domain/state/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              _InputsWidget(),
              SizedBox(height: 20),
              _ResultButtonWidget(),
              SizedBox(height: 20),
              _ResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputsWidget extends StatelessWidget {
  const _InputsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: context.findAncestorStateOfType<_HomeScreenState>()?._latController,
            decoration: const InputDecoration(hintText: 'Широта'),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: TextField(
            controller: context.findAncestorStateOfType<_HomeScreenState>()?._lngController,
            decoration: const InputDecoration(hintText: 'Долгота'),
          ),
        ),
      ],
    );
  }
}

class _ResultButtonWidget extends StatelessWidget {
  const _ResultButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final latitude =
            double.tryParse(context.findAncestorStateOfType<_HomeScreenState>()?._latController.text ?? '0') ?? 0.0;
        final longitude =
            double.tryParse(context.findAncestorStateOfType<_HomeScreenState>()?._lngController.text ?? '0') ?? 0.0;
        context.read<HomeBloc>().add(HomeFetch(latitude: latitude, longitude: longitude));
      },
      child: const Text('Получить'),
    );
  }
}

class _ResultWidget extends StatelessWidget {
  const _ResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeLoading) {
          return const SizedBox(height: 40, width: 40, child: CircularProgressIndicator());
        } else if (state is HomeLoaded) {
          final day = state.day;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Восход: ${_dateToString(day.sunrise)}'),
              Text('Заход: ${_dateToString(day.sunset)}'),
              Text('Полдень: ${_dateToString(day.solarNoon)}'),
              Text('Продолжительность: ${day.dayLength} секунд'),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  String _dateToString(DateTime date) {
    final hours = _formatDateXX(date.hour);
    final minutes = _formatDateXX(date.minute);
    final seconds = _formatDateXX(date.second);
    return '$hours:$minutes:$seconds';
  }

  String _formatDateXX(int value) {
    return value < 9 ? "0$value" : '$value';
  }
}
