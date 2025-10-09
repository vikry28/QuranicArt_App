import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../shared/utils/colors.dart';
import '../../shared/widgets/custom_prayer_time.dart';

class PrayerTimeScreen extends StatefulWidget {
  const PrayerTimeScreen({super.key});

  @override
  _PrayerTimeScreenState createState() => _PrayerTimeScreenState();
}

class _PrayerTimeScreenState extends State<PrayerTimeScreen> {
  Position? _currentPosition;
  String? _prayerTimeError;
  Map<String, dynamic>? _prayerTimes;

  @override
  void initState() {
    super.initState();
    _getPermission();
    _getCurrentLocation();
  }

  Future<void> _getPermission() async {
    final permissionStatus = await Geolocator.requestPermission();
    if (permissionStatus == LocationPermission.denied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Izin lokasi tidak diberikan'),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Buka pengaturan',
            onPressed: () => Geolocator.openAppSettings(),
          ),
        ),
      );
    } else if (permissionStatus == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Izin lokasi tidak diberikan secara permanen'),
          duration: const Duration(seconds: 5),
          action: SnackBarAction(
            label: 'Buka pengaturan',
            onPressed: () => Geolocator.openAppSettings(),
          ),
        ),
      );
    } else {
      // izin lokasi diberikan, lanjutkan dengan proses selanjutnya
    }
  }

  Future<void> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      _currentPosition = position;
    });

    await _getPrayerTimes(position.latitude, position.longitude);
  }

  Future<void> _getPrayerTimes(double latitude, double longitude) async {
    final response = await http.get(
      Uri.parse(
          'https://api.aladhan.com/v1/timings?latitude=$latitude&longitude=$longitude&method=7'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(data);
      setState(() {
        _prayerTimes = data['data']['timings'];
      });
    } else {
      setState(() {
        _prayerTimeError = 'Failed to load prayer times';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        leading: Image.asset('assets/images/people.png', color: yellowColor),
        title: const Text(
          'Waktu Sholat',
          style: TextStyle(color: whiteColor),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: backgroundColor,
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(150),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                  child: Image.asset(
                    'assets/images/sholat.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          )
        ],
        body: Center(
          child: _currentPosition != null
              ? _prayerTimes != null
                  ? ListView(
                      children: [
                        CustomPrayerTimes(
                            nameTimes: 'Imsak',
                            time: _prayerTimes!['Imsak'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Subuh',
                            time: _prayerTimes!['Fajr'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Terbit',
                            time: _prayerTimes!['Sunrise'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Dzuhur',
                            time: _prayerTimes!['Dhuhr'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Ashar',
                            time: _prayerTimes!['Asr'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Maghrib',
                            time: _prayerTimes!['Maghrib'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                        CustomPrayerTimes(
                            nameTimes: 'Isya',
                            time: _prayerTimes!['Isha'],
                            iconSholat: 'assets/images/people.png',
                            iconWaktu: 'assets/images/imsak.png'),
                      ],
                    )
                  : Text(
                      _prayerTimeError ?? 'Memuat waktu sholat...',
                      style: const TextStyle(color: whiteColor),
                    )
              : const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
