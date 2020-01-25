import 'file:///D:/Programs/Flutter/FirstApp/flutter_app/lib/data/Log.dart';

class SandGlass{
  int _sand = 0;

  time(){
    return _sand;
  }

  Future tick(int sand) async{
    this._sand = sand;
    Log().setLog('Start tick\n');
    while(this._sand > 0){
      Log().setLog('tick: $_sand\n');
      this._sand--;
      await Future.delayed(const Duration(milliseconds: 100));
    }
    Log().setLog('End tick\n');
  }

}