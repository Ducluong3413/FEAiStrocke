import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HealthDashboard(),
    );
  }
}

class HealthDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Center(
                child: Text(
                  'Hi, WelcomeBack\nMinh Nguyet',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),
              healthCard('Health'),
              SizedBox(height: 20),
              healthCard('Blood pressure'),
              SizedBox(height: 20),
              warningCard(
                '⚠️ STROKE RISK WARNING!',
                'Blood Pressure: 180/110 mmHg (HIGH)\nHeart Rate: 120 BPM (ABNORMAL)\nStroke Risk: HIGH',
                Colors.red,
              ),
              SizedBox(height: 20),
              warningCard(
                '⚠️ MODERATE HEALTH ALERT!',
                'Blood Pressure: 135/85 mmHg (ELEVATED)\nHeart Rate: 90 BPM (SLIGHTLY HIGH)\nStroke Risk: MODERATE',
                Colors.yellow[700]!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget healthCard(String title) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Container(
            height: 150,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(show: false),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 56),
                      FlSpot(1, 64),
                      FlSpot(2, 76),
                      FlSpot(3, 78),
                      FlSpot(4, 70),
                      FlSpot(5, 37),
                    ],
                    isCurved: true,
                    // colors: [Colors.purple],
                    dotData: FlDotData(show: true),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget warningCard(String title, String content, Color color) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(content, style: TextStyle(fontSize: 14, color: Colors.white)),
        ],
      ),
    );
  }
}
