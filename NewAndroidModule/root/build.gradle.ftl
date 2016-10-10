<#if !(perModuleRepositories??) || perModuleRepositories>
buildscript {
    repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
    }
    dependencies {
        classpath 'com.android.tools.build:gradle:${gradlePluginVersion}'
    }
}
</#if>
<#if isLibraryProject?? && isLibraryProject>
apply plugin: 'com.android.library'
<#else>
apply plugin: 'com.android.application'
apply plugin: 'android-apt'
</#if>
<#if !(perModuleRepositories??) || perModuleRepositories>

repositories {
        jcenter()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
}
</#if>

android {
    compileSdkVersion <#if buildApiString?matches("^\\d+$")>${buildApiString}<#else>'${buildApiString}'</#if>
    buildToolsVersion "${buildToolsVersion}"

    defaultConfig {
    <#if isLibraryProject?? && isLibraryProject>
    <#else>
    applicationId "${packageName}"
    </#if>
        minSdkVersion <#if minApi?matches("^\\d+$")>${minApi}<#else>'${minApi}'</#if>
        targetSdkVersion <#if targetApiString?matches("^\\d+$")>${targetApiString}<#else>'${targetApiString}'</#if>
        versionCode 1
        versionName "1.0"

        testInstrumentationRunner "android.support.test.runner.AndroidJUnitRunner"

    <#if includeCppSupport!false && cppFlags != "">
        externalNativeBuild {
            cmake {
                cppFlags "${cppFlags}"
            }
        }
    </#if>
    }
<#if javaVersion?? && (javaVersion != "1.6" && buildApi lt 21 || javaVersion != "1.7")>

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
        targetCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
    }
</#if>
<#if enableProGuard>
    buildTypes {
        release {
            minifyEnabled false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.pro'
        }
    }
</#if>
<#if includeCppSupport!false>
    externalNativeBuild {
        cmake {
            path "CMakeLists.txt"
        }
    }
</#if>
}

dependencies {
    compile fileTree(dir: 'libs', include: ['*.jar'])
    androidTestCompile('com.android.support.test.espresso:espresso-core:${espressoVersion!"2.0"}', {
        exclude group: 'com.android.support', module: 'support-annotations'
    })
    compile 'com.android.support:appcompat-v7:${buildApi}.+'
    compile 'com.android.support:design:${buildApi}.+'
    compile 'com.android.support:recyclerview-v7:${buildApi}.+'
    compile 'com.android.support:palette-v7:${buildApi}.+'
    compile 'com.android.support:cardview-v7:${buildApi}.+'
    compile 'com.jakewharton:butterknife:8.2.1'
    apt 'com.jakewharton:butterknife-compiler:8.2.1'
    compile 'com.google.code.gson:gson:2.2.4'
    compile 'org.greenrobot:eventbus:3.0.0'
    compile 'io.reactivex:rxandroid:1.2.1'
    compile 'com.squareup.retrofit2:converter-gson:2.1.0'
    compile 'io.reactivex:rxjava:1.1.6'
    compile 'com.squareup.retrofit2:adapter-rxjava:2.1.0'
    compile 'com.squareup.retrofit2:retrofit:2.1.0'
    compile 'com.facebook.fresco:fresco:0.12.0'
    compile 'com.orhanobut:logger:1.15'
    compile 'com.facebook.fresco:animated-gif:0.12.0'
    compile 'com.facebook.fresco:webpsupport:0.12.0'
    compile 'com.facebook.fresco:animated-webp:0.12.0'
    compile 'com.facebook.fresco:imagepipeline-okhttp3:0.12.0'
    compile 'com.github.hotchemi:permissionsdispatcher:2.1.3'
    compile 'com.readystatesoftware.systembartint:systembartint:1.0.3'
    compile 'com.github.bumptech.glide:glide:3.7.0'
    apt 'com.github.hotchemi:permissionsdispatcher-processor:2.1.3'
    debugCompile 'com.squareup.leakcanary:leakcanary-android:1.4-beta2'
    releaseCompile 'com.squareup.leakcanary:leakcanary-android-no-op:1.4-beta2'
    testCompile 'com.squareup.leakcanary:leakcanary-android-no-op:1.4-beta2'

<#if WearprojectName?has_content && NumberOfEnabledFormFactors?has_content && NumberOfEnabledFormFactors gt 1 && Wearincluded>
    wearApp project(':${WearprojectName}')
    compile 'com.google.android.gms:play-services:+'
</#if>
}
