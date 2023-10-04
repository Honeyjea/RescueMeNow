import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    double textSize = screenWidth > 600 ? 24.0 : 16.0;

    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
      ),
      home: MyHomePage(textSize: textSize),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final double textSize;

  const MyHomePage({Key? key, required this.textSize}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSensorActivated = false;
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;

  @override
  void initState() {
    super.initState();

    // Initialize the gyroscope listener
    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        // Update gyroscope data
        x = event.x;
        y = event.y;
        z = event.z;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text('RescueMeNow!'),
          ],
        ),
        shape: const Border(
          bottom: BorderSide(
            color: Color.fromARGB(255, 248, 247, 247),
            width: 2.0,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth > 600 ? 50 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Activate Sensors',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: widget.textSize,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        'To activate the sensors,\nkindly turn on the button.',
                        style: TextStyle(fontSize: widget.textSize * 0.7),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: isSensorActivated,
                  onChanged: (newValue) {
                    setState(() {
                      isSensorActivated = newValue;
                    });
                  },
                  activeColor: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'lib/assets/1.png',
                  width: screenWidth > 600 ? 120 : 80,
                  height: screenWidth > 600 ? 120 : 80,
                ),
                Image.asset(
                  'lib/assets/2.png',
                  width: screenWidth > 600 ? 120 : 80,
                  height: screenWidth > 600 ? 120 : 80,
                ),
                Image.asset(
                  'lib/assets/3.png',
                  width: screenWidth > 600 ? 120 : 80,
                  height: screenWidth > 600 ? 120 : 80,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Detect sudden \n movements',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Smartphone Shake',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  'Detect steps',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            const Spacer(),
            const Text(
              'REMINDER!!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Color.fromARGB(255, 212, 30, 30),
              ),
            ),
            const SizedBox(height: 50),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  ' This mobile application is connected to RescueMeNow Police website. '
                  'For the emergency response, Police local stations are being notified '
                  'in the nearest station away from the victim',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 50),
              ],
            ),
            // Display gyroscope data
            const SizedBox(height: 10),
            Text(
              'Gyroscope Data:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'X: ${x.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Y: ${y.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Z: ${z.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
