import 'package:meerkat/model/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company.g.dart';

@riverpod
List<Company> companies(CompaniesRef ref) => const [
      Company(
        name: 'Google',
        ticker: 'GOOGL',
        logoUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png',
        stockPrice: 3000.0,
      ),
      Company(
        name: 'Amazon',
        ticker: 'AMZN',
        logoUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png',
        stockPrice: 3500.0,
      ),
      Company(
        name: 'Meta',
        ticker: 'META',
        logoUrl:
            'https://uxwing.com/wp-content/themes/uxwing/download/brands-and-social-media/meta-icon.png',
        stockPrice: 300.0,
      ),
      Company(
        name: 'Microsoft',
        ticker: 'MSFT',
        logoUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Microsoft_logo.svg/1024px-Microsoft_logo.svg.png',
        stockPrice: 300.0,
      ),
      Company(
        name: 'Nvidia',
        ticker: 'NVDA',
        logoUrl:
            'https://upload.wikimedia.org/wikipedia/sco/thumb/2/21/Nvidia_logo.svg/1024px-Nvidia_logo.svg.png',
        stockPrice: 300.0,
      ),
      Company(
        name: 'Apple',
        ticker: 'AAPL',
        logoUrl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Apple_logo_black.svg/1920px-Apple_logo_black.svg.png',
        stockPrice: 300.0,
      ),
    ];
