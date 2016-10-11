<?xml version="1.0"?>
<recipe>

    <#if useSupport><dependency mavenUrl="com.android.support:support-v4:${buildApi}.+"/></#if>
    <merge from="root/res/values/strings.xml" to="${escapeXmlAttribute(resOut)}/values/strings.xml"/>

    <#if includeLayout>
        <instantiate from="root/res/layout/fragment_blank.xml.ftl" to="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml"/>

        <open file="${escapeXmlAttribute(resOut)}/layout/${escapeXmlAttribute(fragmentName)}.xml"/>
    </#if>

    <open file="${escapeXmlAttribute(srcOut)}/${className}.java"/>

    <instantiate from="root/src/app_package/MVPFragment.java.ftl" to="${escapeXmlAttribute(srcOut)}/${className}.java"/>
    <instantiate from="root/src/app_package/MVPContract.java.ftl" to="${escapeXmlAttribute(srcOut)}/${contractClass}.java"/>
    <instantiate from="root/src/app_package/MVPPresenter.java.ftl" to="${escapeXmlAttribute(srcOut)}/${presenterClass}.java"/>
    <instantiate from="root/src/app_package/MVPModle.java.ftl" to="${escapeXmlAttribute(srcOut)}/${modleClass}.java"/>

</recipe>
