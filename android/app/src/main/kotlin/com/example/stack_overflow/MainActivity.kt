package com.example.stack_overflow

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.database.Cursor
import android.media.RingtoneManager
import android.os.BatteryManager
import android.os.Build
import android.net.Uri


class MainActivity: FlutterActivity(){
    private val methodChannel: String = "username";
    private val batteryLevel: String = "batteryLevel"
    private val ringToneChannel: String = "ringToneChannel"


    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine){
        GeneratedPluginRegistrant.registerWith(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, methodChannel).setMethodCallHandler{
            call, result ->if(call.method.equals("getUserName")) {
                result.success("ramkumarshukla00000@gmail.com")
            }
        }


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger,batteryLevel).setMethodCallHandler{
            call, result -> if(call.method.equals("getBatteryLevel")){
                result.success(getBatteryLevel())
            }
        }


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ringToneChannel).setMethodCallHandler{
            call, result ->
            when (call.method){
                "getRingTones" -> {
                    val ringtones = getAllRingTones(this)
                    print(ringtones)
                    result.success(ringtones)
                }
            }
        }

    }
    private fun getAllRingTones(context: Context): List<Map<String, String>>{
        val manager = RingtoneManager(context);
        manager.setType(RingtoneManager.TYPE_RINGTONE);
        val  cursor: Cursor = manager.cursor;
        val list : MutableList<String> = mutableListOf();
        while (cursor.moveToNext()){
            val context = getActivity().applicationContext
            val defaultRingtoneUri: Uri? = RingtoneManager.getActualDefaultRingtoneUri(context, RingtoneManager.TYPE_RINGTONE)

            if (defaultRingtoneUri != null) {
                list.add(defaultRingtoneUri.toString())
                val path: String? = defaultRingtoneUri.path
                if (path != null) {
                    list.add(path)
                } else {
                    list.add("No path available")
                }
            } else {
                list.add("No default ringtone")
            }
        }
        cursor.close()
        return  list;
    }

     private fun getBatteryLevel(): Int {
         val batteryLevel: Int = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                  val batteryManager = getSystemService(Context.BATTERY_SERVICE) as BatteryManager
                  batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
              } else {
                  val intent = ContextWrapper(applicationContext).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
                  (intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                          intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)
              }
        return batteryLevel
}
}
