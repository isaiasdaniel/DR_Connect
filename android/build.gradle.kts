<<<<<<< HEAD
allprojects {
   buildscript {
    ext.kotlin_version = '1.9.0'
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:8.2.2'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        classpath 'dev.flutter:flutter-gradle-plugin:2.8.0'  // Asegúrate de que esta versión sea la correcta
    }
}
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
=======
// Archivo android/build.gradle

// Top-level build file where you can add configuration options common to all sub-projects/modules.
plugins {
    id 'com.android.application' version '8.2.2' apply false
    id 'com.android.library' version '8.2.2' apply false
    id 'org.jetbrains.kotlin.android' version '1.9.0' apply false
    id("com.google.gms.google-services") version "4.4.2" apply false
}

task clean(type: Delete) {
    delete rootProject.buildDir
}

>>>>>>> 2dd519dd07c5558190c013aa35fe836d76d8cc32
