import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meerkat/provider/quote.dart';

class QuoteInfo extends ConsumerWidget {
  final String ticker;

  const QuoteInfo(
    this.ticker, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quote = ref.watch(quoteProvider(ticker));
    final l10n = AppLocalizations.of(context)!;
    final typography = Theme.of(context).typography.englishLike;
    final colorScheme = Theme.of(context).colorScheme;

    return quote.map(
      data: (data) {
        final quote = data.value;
        final changeColor =
            quote.change >= 0 ? colorScheme.primary : colorScheme.error;
        final changeStyle = typography.labelLarge?.copyWith(
          color: changeColor,
        );

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  l10n.price(quote.price),
                  style: typography.displayMedium,
                ),
                Icon(
                  quote.change >= 0
                      ? Icons.arrow_drop_up
                      : Icons.arrow_drop_down,
                  color: changeColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.decimal(quote.change),
                      style: changeStyle,
                    ),
                    Text(
                      l10n.percentage(quote.changePercent),
                      style: changeStyle,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            _Row("Open", l10n.price(quote.open)),
            _Row("High", l10n.price(quote.high)),
            _Row("Low", l10n.price(quote.low)),
            _Row("Volume", l10n.amount(quote.volume)),
            _Row("Latest trading day", l10n.date(quote.latestTradingDay)),
            _Row("Previous close", l10n.price(quote.previousClose)),
          ],
        );
      },
      error: (error) => Text(error.error.toString()),
      loading: (_) => const Center(child: CircularProgressIndicator()),
    );
  }
}

class _Row extends StatelessWidget {
  final String title;
  final String value;

  const _Row(
    this.title,
    this.value, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).typography.englishLike.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant),
          ),
          const Spacer(),
          Text(
            value,
            style: Theme.of(context).typography.englishLike.bodyLarge,
          ),
        ],
      ),
    );
  }
}
