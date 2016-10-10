<?xml version="1.0"?>
<recipe>

    <#if backwardsCompatibility!true>
        <dependency mavenUrl="com.android.support:appcompat-v7:${buildApi}.+"/>
    </#if>

    <#if unitTestsSupported>
        <dependency mavenUrl="junit:junit:4.12" gradleConfiguration="testCompile"/>
    </#if>

    <#if !createActivity>
        <mkdir at="${escapeXmlAttribute(srcOut)}"/>
    </#if>
    <mkdir at="${escapeXmlAttribute(srcOut)}/base"/>
    <mkdir at="${escapeXmlAttribute(srcOut)}/bean"/>
    <mkdir at="${escapeXmlAttribute(srcOut)}/config"/>
    <mkdir at="${escapeXmlAttribute(srcOut)}/db"/>
    <mkdir at="${escapeXmlAttribute(srcOut)}/http"/>
    <mkdir at="${escapeXmlAttribute(srcOut)}/ui"/>
    <mkdir at="${escapeXmlAttribute(srcOut)}/utils"/>
    <mkdir at="${escapeXmlAttribute(srcOut)}/image"/>

    <instantiate from="root/src/app_package/base/BaseActivity.java.ftl" to="${escapeXmlAttribute(srcOut)}/base/BaseActivity.java"/>
    <instantiate from="root/src/app_package/base/BaseFragment.java.ftl" to="${escapeXmlAttribute(srcOut)}/base/BaseFragment.java"/>
    <instantiate from="root/src/app_package/base/IModle.java.ftl" to="${escapeXmlAttribute(srcOut)}/base/IModle.java"/>
    <instantiate from="root/src/app_package/base/IPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/base/IPresenter.java"/>
    <instantiate from="root/src/app_package/base/IView.java.ftl" to="${escapeXmlAttribute(srcOut)}/base/IView.java"/>
    <instantiate from="root/src/app_package/config/UrlConfig.java.ftl" to="${escapeXmlAttribute(srcOut)}/config/UrlConfig.java"/>

    <instantiate from="root/src/app_package/http/CerConfig.java.ftl" to="${escapeXmlAttribute(srcOut)}/http/CerConfig.java"/>

    <instantiate from="root/src/app_package/http/HttpHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/http/HttpHelper.java"/>

    <instantiate from="root/src/app_package/http/RetrofitApiService.java.ftl" to="${escapeXmlAttribute(srcOut)}/http/RetrofitApiService.java"/>

    <instantiate from="root/src/app_package/http/SSLHelper.java.ftl" to="${escapeXmlAttribute(srcOut)}/http/SSLHelper.java"/>

    <instantiate from="root/src/app_package/image/ImageHepler.java.ftl" to="${escapeXmlAttribute(srcOut)}/image/ImageHepler.java"/>

    <instantiate from="root/src/app_package/App.java.ftl" to="${escapeXmlAttribute(srcOut)}/App.java"/>

    <mkdir at="${escapeXmlAttribute(projectOut)}/libs"/>

    <merge from="root/settings.gradle.ftl" to="${escapeXmlAttribute(topOut)}/settings.gradle"/>
    <instantiate from="root/build.gradle.ftl" to="${escapeXmlAttribute(projectOut)}/build.gradle"/>
    <instantiate from="root/AndroidManifest.xml.ftl" to="${escapeXmlAttribute(manifestOut)}/AndroidManifest.xml"/>

    <mkdir at="${escapeXmlAttribute(resOut)}/drawable"/>
    <mkdir at="${escapeXmlAttribute(resOut)}/raw"/>
    <#if copyIcons && !isLibraryProject>
        <copy from="root/res/mipmap-hdpi" to="${escapeXmlAttribute(resOut)}/mipmap-hdpi"/>
        <copy from="root/res/mipmap-mdpi" to="${escapeXmlAttribute(resOut)}/mipmap-mdpi"/>
        <copy from="root/res/mipmap-xhdpi" to="${escapeXmlAttribute(resOut)}/mipmap-xhdpi"/>
        <copy from="root/res/mipmap-xxhdpi" to="${escapeXmlAttribute(resOut)}/mipmap-xxhdpi"/>
        <copy from="root/res/mipmap-xxxhdpi" to="${escapeXmlAttribute(resOut)}/mipmap-xxxhdpi"/>
    </#if>
    <#if makeIgnore>
        <copy from="root/module_ignore" to="${escapeXmlAttribute(projectOut)}/.gitignore"/>
    </#if>
    <#if enableProGuard>
        <instantiate from="root/proguard-rules.txt.ftl" to="${escapeXmlAttribute(projectOut)}/proguard-rules.pro"/>
    </#if>
    <#if !(isLibraryProject??) || !isLibraryProject>
        <instantiate from="root/res/values/styles.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/styles.xml"/>
        <#if buildApi gte 22>
            <copy from="root/res/values/colors.xml" to="${escapeXmlAttribute(resOut)}/values/colors.xml"/>
        </#if>
    </#if>

    <instantiate from="root/res/values/strings.xml.ftl" to="${escapeXmlAttribute(resOut)}/values/strings.xml"/>

    <instantiate from="root/test/app_package/ExampleInstrumentedTest.java.ftl" to="${escapeXmlAttribute(testOut)}/ExampleInstrumentedTest.java"/>

    <#if unitTestsSupported>
        <instantiate from="root/test/app_package/ExampleUnitTest.java.ftl" to="${escapeXmlAttribute(unitTestOut)}/ExampleUnitTest.java"/>
    </#if>
    <#if includeCppSupport!false>
        <instantiate from="root/CMakeLists.txt.ftl" to="${escapeXmlAttribute(projectOut)}/CMakeLists.txt"/>

        <mkdir at="${nativeSrcOut}"/>
        <instantiate from="root/native-lib.cpp.ftl" to="${nativeSrcOut}/native-lib.cpp"/>
    </#if>

</recipe>
