# locale_notifications

This is Locale Notification App.

## Getting Started

# Set-Up

#In AndroidManifest.xml
Add:

##1
 uses-permission android:name="android.permission.VIBRATE" 
 uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED".
##2
 **under**  activity add
                   android:turnScreenOn="true"
           
##3
  <receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
           <intent-filter>
               <action android:name="android.intent.action.BOOT_COMPLETED"/>
               <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
           </intent-filter>
       </receiver>
  
  
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
