<?php
require_once("rpcl/rpcl.inc.php");
require_once("Logincontrol.php");
//Includes
use_unit("forms.inc.php");
use_unit("extctrls.inc.php");
use_unit("stdctrls.inc.php");
use_unit("menus.inc.php");

//Class definition
class MasterPage extends Page
{
   public $Image1 = null;
   public $MainMenu1 = null;
   function MainMenu1Click($sender, $params)
   {
      if($params['tag'] == 1)
      {
         redirect("Department.php");
      }
      else
         if($params['tag'] == 2)
         {
           setcookie('loginid', null);
           redirect('Login.php');

         }
   }
   function MasterPageCreate($sender, $params)
   {
      global $LoginControl;

      $currentFile = ($_SERVER['SCRIPT_NAME']);
      $parts = Explode('/', $currentFile);
      $currentFile = $parts[count($parts) - 1];

      if($currentFile != 'Login.php')
      {
         if( ! $LoginControl->isAuthenticated())
         {
            redirect("Login.php");
         }
      }

   }
}

global $application;

global $MasterPage;

//Creates the form
$MasterPage = new MasterPage($application);

//Read from resource file
$MasterPage->loadResource(__FILE__);

//Shows the form
$MasterPage->show();

?>
