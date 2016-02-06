<?php
<object class="MasterPage" name="MasterPage" baseclass="Page">
  <property name="Background"></property>
  <property name="Caption">Page1</property>
  <property name="DocType">dtNone</property>
  <property name="Height">546</property>
  <property name="IsMaster">1</property>
  <property name="Name">MasterPage</property>
  <property name="Width">983</property>
  <property name="OnCreate">MasterPageCreate</property>
  <object class="Image" name="Image1" >
    <property name="Border">0</property>
    <property name="Height">155</property>
    <property name="ImageSource">Penguins.jpg</property>
    <property name="Link"></property>
    <property name="LinkTarget"></property>
    <property name="Name">Image1</property>
    <property name="Width">982</property>
  </object>
  <object class="MainMenu" name="MainMenu1" >
    <property name="Height">24</property>
    <property name="Items"><![CDATA[a:1:{i:0;a:6:{s:7:&quot;Caption&quot;;s:14:&quot;Server Methods&quot;;s:10:&quot;ImageIndex&quot;;s:1:&quot;0&quot;;s:13:&quot;SelectedIndex&quot;;s:1:&quot;0&quot;;s:10:&quot;StateIndex&quot;;s:2:&quot;-1&quot;;s:3:&quot;Tag&quot;;s:1:&quot;0&quot;;s:5:&quot;Items&quot;;a:2:{i:0;a:6:{s:7:&quot;Caption&quot;;s:18:&quot;List of Department&quot;;s:10:&quot;ImageIndex&quot;;s:1:&quot;0&quot;;s:13:&quot;SelectedIndex&quot;;s:1:&quot;0&quot;;s:10:&quot;StateIndex&quot;;s:2:&quot;-1&quot;;s:3:&quot;Tag&quot;;s:1:&quot;1&quot;;s:5:&quot;Items&quot;;a:0:{}}i:1;a:6:{s:7:&quot;Caption&quot;;s:6:&quot;Logoff&quot;;s:10:&quot;ImageIndex&quot;;s:1:&quot;0&quot;;s:13:&quot;SelectedIndex&quot;;s:1:&quot;0&quot;;s:10:&quot;StateIndex&quot;;s:2:&quot;-1&quot;;s:3:&quot;Tag&quot;;s:1:&quot;2&quot;;s:5:&quot;Items&quot;;a:0:{}}}}}]]></property>
    <property name="Name">MainMenu1</property>
    <property name="Top">155</property>
    <property name="Width">982</property>
    <property name="OnClick">MainMenu1Click</property>
  </object>
</object>
?>
