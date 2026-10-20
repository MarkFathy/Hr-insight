# ============================================================
# Flutter ProGuard Rules
# ============================================================

# --- Flutter Engine ---
-keep class io.flutter.** { *; }
-keep class io.flutter.embedding.** { *; }
-dontwarn io.flutter.embedding.**
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.app.** { *; }

# ============================================================
# Dart / Flutter generated code
# ============================================================
-keep class com.fourth_pyramid.hrapp.** { *; }

# ============================================================
# Android / Google
# ============================================================
-keep class androidx.** { *; }
-dontwarn androidx.**
-keep class com.google.android.** { *; }
-dontwarn com.google.android.**

# ============================================================
# Firebase
# ============================================================
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# ============================================================
# Geolocator
# ============================================================
-keep class com.baseflow.geolocator.** { *; }
-dontwarn com.baseflow.geolocator.**

# ============================================================
# Kotlin / Coroutines
# ============================================================
-keep class kotlin.** { *; }
-dontwarn kotlin.**
-keep class kotlinx.coroutines.** { *; }
-dontwarn kotlinx.coroutines.**

# ============================================================
# Gson / JSON serialization
# ============================================================
-keepattributes Signature
-keepattributes *Annotation*
-keep class sun.misc.Unsafe { *; }
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# ============================================================
# OkHttp / Retrofit
# ============================================================
-dontwarn okhttp3.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okio.**
-keep class retrofit2.** { *; }
-dontwarn retrofit2.**

# ============================================================
# Reflection
# ============================================================
-keepattributes EnclosingMethod
-keepattributes InnerClasses

# ============================================================
# Suppress common warnings from third-party libs
# ============================================================
-dontwarn org.codehaus.mojo.animal_sniffer.*
-dontwarn javax.annotation.**
-dontwarn javax.inject.**
