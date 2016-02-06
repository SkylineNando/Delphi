<?php
<object class="Page1" name="Page1" baseclass="Page">
  <property name="Background"></property>
  <property name="Caption">Login Page</property>
  <property name="DocType">dtNone</property>
  <property name="Height">370</property>
  <property name="IsMaster">0</property>
  <property name="Name">Page1</property>
  <property name="Width">597</property>
  <property name="OnCreate">Page1Create</property>
  <object class="Label" name="Label1" >
    <property name="Caption">Username</property>
    <property name="Font">
    <property name="Size">14px</property>
    </property>
    <property name="Height">19</property>
    <property name="Left">188</property>
    <property name="Name">Label1</property>
    <property name="ParentFont">0</property>
    <property name="Top">243</property>
    <property name="Width">91</property>
  </object>
  <object class="Label" name="Label2" >
    <property name="Caption">Password</property>
    <property name="Font">
    <property name="Size">14px</property>
    </property>
    <property name="Height">19</property>
    <property name="Left">184</property>
    <property name="Name">Label2</property>
    <property name="ParentFont">0</property>
    <property name="Top">277</property>
    <property name="Width">99</property>
  </object>
  <object class="Edit" name="edUserName" >
    <property name="Font">
    <property name="Size">14px</property>
    </property>
    <property name="Height">21</property>
    <property name="Left">302</property>
    <property name="Name">edUserName</property>
    <property name="ParentFont">0</property>
    <property name="Top">243</property>
    <property name="Width">121</property>
  </object>
  <object class="Edit" name="edPassword" >
    <property name="Font">
    <property name="Size">14px</property>
    </property>
    <property name="Height">21</property>
    <property name="IsPassword">1</property>
    <property name="Left">302</property>
    <property name="Name">edPassword</property>
    <property name="ParentFont">0</property>
    <property name="Top">276</property>
    <property name="Width">121</property>
  </object>
  <object class="Button" name="Button1" >
    <property name="Caption">Login</property>
    <property name="Font">
    <property name="Size">14px</property>
    </property>
    <property name="Height">32</property>
    <property name="Left">216</property>
    <property name="Name">Button1</property>
    <property name="ParentFont">0</property>
    <property name="Top">315</property>
    <property name="Width">195</property>
    <property name="OnClick">Button1Click</property>
  </object>
</object>
?>
