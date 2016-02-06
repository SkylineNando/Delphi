<?php
require_once("rpcl/rpcl.inc.php");
require_once("MasterPage.php");
//Includes
use_unit("forms.inc.php");
use_unit("extctrls.inc.php");
use_unit("stdctrls.inc.php");

//Class definition
class Page2 extends MasterPage
{
}

global $application;

global $Page2;

//Creates the form
$Page2=new Page2($application);

//Read from resource file
$Page2->loadResource(__FILE__);

//Shows the form
$Page2->show();

?>
