import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:meerkat/model/company.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company.g.dart';

@riverpod
IList<Company> companies(CompaniesRef ref) => const [
      Company(
        name: 'NVIDIA Corporation',
        ticker: 'NVDA',
        logoUrl: 'https://asset.brandfetch.io/idXoj5DuCE/idoRzRdSsF.png',
        stockPrice: 943.72,
      ),
      Company(
        name: 'Meta Platforms, Inc.',
        ticker: 'META',
        logoUrl: 'https://asset.brandfetch.io/idWvz5T3V7/idbf2A6XBY.png',
        stockPrice: 472.15,
      ),
      Company(
        name: 'Microsoft Corporation',
        ticker: 'MSFT',
        logoUrl: 'https://asset.brandfetch.io/idchmboHEZ/idtz-2CKRH.jpeg',
        stockPrice: 425.04,
      ),
      Company(
        name: 'JPMorgan Chase & Co.',
        ticker: 'JPM',
        logoUrl: 'https://asset.brandfetch.io/idB8rdGiLv/id3R62JK_w.jpeg',
        stockPrice: 201.19,
      ),
      Company(
        name: 'Apple Inc.',
        ticker: 'AAPL',
        logoUrl: 'https://asset.brandfetch.io/idnrCPuv87/idQGxxARFI.jpeg',
        stockPrice: 191.32,
      ),
      Company(
        name: 'Amazon.com, Inc.',
        ticker: 'AMZN',
        logoUrl: 'https://asset.brandfetch.io/idawOgYOsG/idkXDhRL_u.jpeg',
        stockPrice: 184.91,
      ),
      Company(
        name: 'Alphabet Inc.',
        ticker: 'GOOGL',
        logoUrl: 'https://asset.brandfetch.io/id6O2oGzv-/idNEgS9h8q.jpeg',
        stockPrice: 177.10,
      ),
      Company(
        name: 'Tesla, Inc.',
        ticker: 'TSLA',
        logoUrl: 'https://asset.brandfetch.io/id2S-kXbuK/idWvKxYIpS.png',
        stockPrice: 174.02,
      ),
      Company(
        name: 'Advanced Micro Devices, Inc.',
        ticker: 'AMD',
        logoUrl: 'https://asset.brandfetch.io/idnN8KdbKa/idB9H48jP5.jpeg',
        stockPrice: 166.43,
      ),
      Company(
        name: 'Micron Technology, Inc.',
        ticker: 'MU',
        logoUrl: 'https://asset.brandfetch.io/idNcgNtzG1/id2OsD-Xku.jpeg',
        stockPrice: 129.39,
      ),
    ].lock;
