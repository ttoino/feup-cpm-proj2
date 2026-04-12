# FEUP-CPM-PROJ2

Second project for the CPM course unit at FEUP.

Meerkat is a mobile stock market analysis application developed for the Mobile Computing course. The app provides an accessible and informative way to analyze and compare the evolution of stock prices from different companies.

## Features

- Visualization of 10 company stocks on the home screen
- Detailed company pages with stock charts (candlestick and mountain charts)
- Multiple time range options (today, past week, past month, etc.)
- Market news feed with company filtering
- Company search functionality
- Stock comparison between two companies
- Real-time and historical data visualization

## Architecture

The app is built with Flutter using:

- **Riverpod**: For global state management and data caching
- **Clean Architecture**: Separation between UI (Widgets/Screens), state (Providers), and data (API Clients)
- **REST API Integration**: Alpha Vantage API for news, TwelveData API for stock data

## Building and Running

This is a Flutter project. To build and run:

1. Create a `.env` file with your API keys:
```
ALPHA_VANTAGE_KEY=<your_key>
TWELVE_DATA_KEY=<your_key>
```

2. Install dependencies and generate code:
```bash
flutter pub get
flutter pub run build_runner build
```

3. Run the app:
```bash
flutter run
```

## Unit info

- **Name**: Computação Móvel (Mobile Computing)
- **Date**: Year 1, Semester 2, 2023/24
- [**More info**](https://sigarra.up.pt/feup/ucurr_geral.ficha_uc_view?pv_ocorrencia_id=518814)

## Disclaimer

This repository (and all others with the name format `feup-*`) are for archival and educational purposes only.

If you don't understand some part of the code or anything else in this repo, feel free to ask (although I may not understand it myself anymore).

Keep in mind that this repo is public. If you copy any code and use it in your school projects you may be flagged for plagiarism by automated tools.
