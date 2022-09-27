# Locale Notifications App

This is Locale Notification App.

## Getting Started

## Set-Up

### In AndroidManifest.xml

#### Add:

**#1**
 ```xml
 <uses-permission android:name="android.permission.VIBRATE" />
 <uses-permission android:name="android.permission.RECEIVE_BOOT_COMPLETED"/>
```

**#2**
 **under**  activity add
                   android:turnScreenOn="true"
           
**#3**
 ```xml
<receiver android:name="com.dexterous.flutterlocalnotifications.ScheduledNotificationBootReceiver">
           <intent-filter>
               <action android:name="android.intent.action.BOOT_COMPLETED"/>
               <action android:name="android.intent.action.MY_PACKAGE_REPLACED"/>
           </intent-filter>
       </receiver>.
```
### pubspec.yaml

#### Add:
```xml 
flutter_local_notifications: ^9.7.0
rxdart: ^0.27.5
timezone: ^0.8.0
```
### app build.gradle
#### Add:
```xml
compileSdkVersion 33
minSdkVersion 21
targetSdkVersion 33
multiDexEnabled true

**dependencies**
coreLibraryDesugaring 'com.android.tools:desugar_jdk_libs:1.1.5'
```
### build.gradle
#### Add:
```xml
**dependencies**
classpath 'com.android.tools.build:gradle:4.2.2'
```
