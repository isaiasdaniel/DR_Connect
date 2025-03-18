plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.dr.dr_connect_new_fresh"
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
        // TODO: Especifica tu propio ID de aplicación único
        applicationId = "com.dr.dr_connect_new_fresh"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Agrega tu propia configuración de firma para la versión de producción
            signingConfig signingConfigs.getByName("release") // Cambié de 'debug' a 'release'
            minifyEnabled false  // Si usas Proguard o R8, habilita minifyEnabled
            proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
        }
    }
}

signingConfigs {
    release {
        storeFile file("path/to/your/keystore.jks")  // Cambia esta ruta a tu archivo keystore
        storePassword "your_keystore_password"  // Cambia con tu contraseña de keystore
        keyAlias "your_key_alias"  // Cambia con tu alias de clave
        keyPassword "your_key_password"  // Cambia con tu contraseña de clave
    }
}

flutter {
    source = "../.."  // Ruta relativa de tu proyecto Flutter (si está en un directorio superior)
}
