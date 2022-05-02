package com.atlas.flutter_playground

import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val BATTERY_CHANNEL = "samples.flutter.dev/battery"
    private val TOAST_CHANNEL = "com.atlas.flutter_playground/toast_channel"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            BATTERY_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "getBatteryLevel") {
                val batteryLevel = getBatteryLevel()

                if (batteryLevel != -1) {
                    result.success(batteryLevel)
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            TOAST_CHANNEL
        ).setMethodCallHandler { call, result ->
            val argument = call.arguments() as Map<String, String>;
            val message = argument["message"];
            if (call.method == "showToast") {
                print(result);
                Toast.makeText(context, message, Toast.LENGTH_SHORT).show();
            }
        }

    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int

        val intent = ContextWrapper(applicationContext).registerReceiver(
            null,
            IntentFilter(Intent.ACTION_BATTERY_CHANGED)
        )
        batteryLevel =
            intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(
                BatteryManager.EXTRA_SCALE,
                -1
            )


        return batteryLevel
    }

}
