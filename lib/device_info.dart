import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

///获取设备信息
class DeviceInfoPage extends StatefulWidget {
  DeviceInfoPage({Key key}) : super(key: key);

  @override
  _DeviceInfoPageState createState() => _DeviceInfoPageState();
}

class _DeviceInfoPageState extends State<DeviceInfoPage> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  List<Widget> textWidgets = [];

  Future<void> _deviceInformation() async {
    setState(() => textWidgets.clear());
    AndroidDeviceInfo androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    setState(() {
      textWidgets.add(Text('version: ${androidDeviceInfo.version.sdkInt}'));
      textWidgets.add(Text('androidId: ${androidDeviceInfo.androidId}'));
      textWidgets.add(Text('board: ${androidDeviceInfo.board}'));
      textWidgets.add(Text('bootloader: ${androidDeviceInfo.bootloader}'));
      textWidgets.add(Text('brand: ${androidDeviceInfo.brand}'));
      textWidgets.add(Text('device: ${androidDeviceInfo.device}'));
      textWidgets.add(Text('display: ${androidDeviceInfo.display}'));
      textWidgets.add(Text('fingerprint: ${androidDeviceInfo.fingerprint}'));
      textWidgets.add(Text('hardware: ${androidDeviceInfo.hardware}'));
      textWidgets.add(Text('hashCode: ${androidDeviceInfo.hashCode}'));
      textWidgets.add(Text('host: ${androidDeviceInfo.host}'));
      textWidgets.add(Text('id: ${androidDeviceInfo.id}'));
      textWidgets
          .add(Text('isPhysicalDevice: ${androidDeviceInfo.isPhysicalDevice}'));
      textWidgets.add(Text('manufacturer: ${androidDeviceInfo.manufacturer}'));
      textWidgets.add(Text('model: ${androidDeviceInfo.model}'));
      textWidgets.add(Text('product: ${androidDeviceInfo.product}'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('获取设备信息'),
      ),
      body: RefreshIndicator(
        displacement: 8,
        onRefresh: _deviceInformation,
        child: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You devices information:',
                    style: TextStyle(fontSize: 28),
                  ),
                  ...textWidgets,
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _deviceInformation,
        tooltip: 'Increment',
        child: Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
