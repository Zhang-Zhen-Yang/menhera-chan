package com.example.myapp;

import android.os.Bundle;
import java.util.Random;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  private static final String CHANNEL = "samples.flutter.test/plugin";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodCallHandler(){
      @Override
      public void onMethodCall(MethodCall call, Result result){
        if(call.method.equals("dataInteraction")) {
          int data = getData();
          result.success(data);
        }else{
            result.notImplemented();
        }
      }
    });
    GeneratedPluginRegistrant.registerWith(this);
  }
  private int getData() {
    Random ran = new Random();
    return ran.nextInt(1000);
  }
}
