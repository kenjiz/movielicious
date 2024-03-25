import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:movielicious/src/core/core.dart';
import 'package:movielicious/src/features/movie_details/domain/models/movie_cast.dart';
import 'package:movielicious/src/features/movie_details/presentation/bloc/credits/movie_credits_cubit.dart';

class MovieCreditsContainer extends StatelessWidget {
  const MovieCreditsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Credits',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  height: 1.5,
                ),
          ),
          const _MovieCredits()
        ].addEqualGap(gap: const Gap(10)),
      ),
    );
  }
}

class _MovieCredits extends StatelessWidget {
  const _MovieCredits();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCreditsCubit, MovieCreditsState>(
      builder: (context, state) {
        return switch (state.status) {
          StateStatus.loading => const Center(
              child: AdaptiveProgressIndicator(),
            ),
          StateStatus.success when state.casts.isNotEmpty => _CreditsWidget(
              casts: state.casts,
            ),
          StateStatus.success => const Center(child: Text('Empty casting...')),
          StateStatus.failure => Center(child: Text(state.error!.message)),
        };
      },
    );
  }
}

class _CreditsWidget extends StatelessWidget {
  const _CreditsWidget({required this.casts});

  final List<MovieCast> casts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: casts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final cast = casts[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: FittedBox(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    child: cast.profilePath != null
                        ? Image.network(
                            cast.profilePath!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/avatar.jpg',
                            fit: BoxFit.cover,
                          ),
                  ),
                  const Gap(5),
                  Flexible(
                    child: Text(
                      cast.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 6),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      cast.character,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 5,
                            fontStyle: FontStyle.italic,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
