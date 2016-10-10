<?xml version="1.0"?>
<recipe>
    <#include "../common/recipe_manifest.xml.ftl" />

        <#if generateLayout>
            <#include "../common/recipe_simple.xml.ftl" />
                <open file="${escapeXmlAttribute(resOut)}/layout/${layoutName}.xml"/>
            </#if>

            <instantiate from="root/src/app_package/SimpleActivity.java.ftl"
              to="${escapeXmlAttribute(srcOut)}/${activityClass}.java"/>
            <instantiate from="root/src/app_package/SimpleContract.java.ftl"
              to="${escapeXmlAttribute(srcOut)}/${contractClass}.java"/>
            <instantiate from="root/src/app_package/SimpleModle.java.ftl"
              to="${escapeXmlAttribute(srcOut)}/${modleClass}.java"/>
            <instantiate from="root/src/app_package/SimplePresenter.java.ftl"
              to="${escapeXmlAttribute(srcOut)}/${presenterClass}.java"/>
            <open file="${escapeXmlAttribute(srcOut)}/${activityClass}.java"/>
  </recipe>
