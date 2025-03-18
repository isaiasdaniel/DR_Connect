plugins {
<<<<<<< HEAD
    id("com.android.application") version "8.2.2" apply false
    id("com.android.library") version "8.2.2" apply false
    id("org.jetbrains.kotlin.android") version "1.9.0" apply false
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.dr_connect_new_fresh"
=======
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // Agregar el plugin de Google Services
}

android {
    namespace = "com.example.dr_connect"
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
<<<<<<< HEAD
        applicationId = "com.example.dr_connect_new_fresh"
=======
        applicationId = "com.example.dr_connect"
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

<<<<<<< HEAD
flutter {
    source = "../.."
=======
dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.10.0")) // Agregar Firebase BoM
    implementation("com.google.firebase:firebase-analytics")
    implementation("com.google.firebase:firebase-auth")
    implementation("com.google.firebase:firebase-firestore")
    implementation("com.google.firebase:firebase-messaging")
    implementation("com.google.firebase:firebase-storage")
>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
}
