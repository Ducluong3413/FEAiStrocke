import 'package:assistantstroke/controler/usermedicaldatas_controller.dart';
import 'package:assistantstroke/model/UserMedicalDataResponse.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeHistory extends StatefulWidget {
  @override
  State<HomeHistory> createState() => _HomeHistoryState();
}

class _HomeHistoryState extends State<HomeHistory> {
  UserMedicalDataResponse? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final controller = UserMedicalDataController();
    try {
      final fetchedData = await controller.fetchUserMedicalData();
      setState(() {
        data = fetchedData;
        isLoading = false;

        if (data?.results != null) {
          print('Dữ liệu đã tải thành công: ${data?.results}');
        } else {
          print('Không có dữ liệu nào.');
        }
      });
    } catch (e) {
      print('Lỗi: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  int? selectedDayIndex; // null = hiển thị tất cả

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      appBar: AppBar(title: Text('Lịch sử các chỉ số sức khỏe')),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildChart(
              'Huyết áp tâm thu',
              Colors.red,
              Colors.blue,
              _getData1(),
            ),
            _buildChart(
              'Huyết áp tâm trương',
              Colors.red,
              Colors.blue,
              _getData2(),
            ),
            _buildChart('SpO2', Colors.red, Colors.blue, _getData3()),
            _buildChart('Nhiệt độ (°C)', Colors.red, Colors.blue, _getData4()),
            _buildChart('Mạch đập (bpm)', Colors.red, Colors.blue, _getData5()),
            _buildChart('pH', Colors.red, Colors.blue, _getData6()),

            SizedBox(height: 20),
            _buildDayButtons(), // Nút chọn ngày ở cuối
          ],
        ),
      ),
    );
  }

  Widget _buildChart(
    String title,
    Color color1,
    Color color2,
    List<List<double>> data,
  ) {
    List<double> ngay = data[0];
    List<double> dem = data[1];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Container(
          height: 150,
          child: BarChart(
            BarChartData(
              barGroups: _buildBarGroups(ngay, dem),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    getTitlesWidget:
                        (value, meta) => Text(
                          '${value.toInt()}',
                          style: TextStyle(fontSize: 10),
                        ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget:
                        (value, meta) => Text(
                          '${value.toInt()}',
                          style: TextStyle(fontSize: 10),
                        ),
                  ),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: true),
            ),
          ),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLegend(color1, 'Ngày'),
            SizedBox(width: 16),
            _buildLegend(color2, 'Đêm'),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }

  List<BarChartGroupData> _buildBarGroups(List<double> ngay, List<double> dem) {
    List<BarChartGroupData> groups = [];

    for (int i = 0; i < ngay.length; i++) {
      if (selectedDayIndex == null || selectedDayIndex == i) {
        groups.add(
          BarChartGroupData(
            x: i + 1,
            barRods: [
              BarChartRodData(toY: ngay[i], color: Colors.red, width: 8),
              BarChartRodData(toY: dem[i], color: Colors.blue, width: 8),
            ],
          ),
        );
      }
    }

    return groups;
  }

  Widget _buildDayButtons() {
    print(_getData1());

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                selectedDayIndex == null ? Colors.blue : Colors.grey[300],
            foregroundColor:
                selectedDayIndex == null ? Colors.white : Colors.black,
          ),
          onPressed: () {
            setState(() {
              selectedDayIndex = null;
            });
          },
          child: Text('ALL'),
        ),
        ...List.generate(14, (index) {
          final isSelected = selectedDayIndex == index;
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
              foregroundColor: isSelected ? Colors.white : Colors.black,
            ),
            onPressed: () {
              setState(() {
                selectedDayIndex = selectedDayIndex == index ? null : index;
              });
            },
            child: Text('${index + 1}'),
          );
        }),
      ],
    );
  }

  // Dữ liệu mẫu
  // List<List<double>> _getData1() => [
  //   [155, 152, 158, 160, 165, 162, 170, 155, 152, 158, 160, 165, 162, 170],
  //   [145, 142, 148, 150, 155, 152, 158, 145, 142, 148, 150, 155, 152, 158],
  // ];
  List<List<double>> _getData1() {
    if (data == null) return [[], []];
    // final ngay = data!.results.map((e) => e.averageSystolicPressure).toList();
    final ngay =
        data?.results?.map((e) => e.averageSystolicPressure).toList() ?? [];

    final dem =
        data?.results?.map((e) => e.averageSystolicPressureNight).toList() ??
        [];

    // nếu bạn chưa có dữ liệu đêm, có thể thay sau
    return [ngay, dem];
  }

  List<List<double>> _getData2() {
    if (data == null) return [[], []];
    // final ngay = data!.results.map((e) => e.averageSystolicPressure).toList();
    final ngay =
        data?.results?.map((e) => e.averageDiastolicPressure).toList() ?? [];

    final dem =
        data?.results?.map((e) => e.averageDiastolicPressureNight).toList() ??
        [];

    // nếu bạn chưa có dữ liệu đêm, có thể thay sau
    return [ngay, dem];
  }

  List<List<double>> _getData3() {
    if (data == null) return [[], []];
    // final ngay = data!.results.map((e) => e.averageSystolicPressure).toList();
    final ngay = data?.results?.map((e) => e.averageSpO2).toList() ?? [];

    final dem = data?.results?.map((e) => e.averageSpO2Night).toList() ?? [];

    // nếu bạn chưa có dữ liệu đêm, có thể thay sau
    return [ngay, dem];
  }

  List<List<double>> _getData4() {
    if (data == null) return [[], []];
    // final ngay = data!.results.map((e) => e.averageSystolicPressure).toList();
    final ngay = data?.results?.map((e) => e.averageTemperature).toList() ?? [];

    final dem =
        data?.results?.map((e) => e.averageTemperatureNight).toList() ?? [];

    // nếu bạn chưa có dữ liệu đêm, có thể thay sau
    return [ngay, dem];
  }

  List<List<double>> _getData5() {
    if (data == null) return [[], []];
    // final ngay = data!.results.map((e) => e.averageSystolicPressure).toList();
    final ngay = data?.results?.map((e) => e.averageHeartRate).toList() ?? [];

    final dem =
        data?.results?.map((e) => e.averageHeartRateNight).toList() ?? [];

    // nếu bạn chưa có dữ liệu đêm, có thể thay sau
    return [ngay, dem];
  }

  List<List<double>> _getData6() {
    if (data == null) return [[], []];
    // final ngay = data!.results.map((e) => e.averageSystolicPressure).toList();
    final ngay = data?.results?.map((e) => e.averagePH).toList() ?? [];

    final dem = data?.results?.map((e) => e.averagePHNight).toList() ?? [];

    // nếu bạn chưa có dữ liệu đêm, có thể thay sau
    return [ngay, dem];
  }

  Widget _buildLegend(Color color, String text) {
    return Row(
      children: [
        Container(width: 12, height: 12, color: color),
        SizedBox(width: 4),
        Text(text, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
