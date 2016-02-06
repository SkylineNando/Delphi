<?php
require_once("rpcl/rpcl.inc.php");
require_once("MasterPage.php");
require_once("ClientClassProxy.php");
require_once("ClientModuleProxy.php");
//Includes
use_unit("forms.inc.php");
use_unit("extctrls.inc.php");
use_unit("stdctrls.inc.php");
use_unit("comctrls.inc.php");

//Class definition
class Page1 extends MasterPage
{
   public $Button1 = null;
   public $edPassword = null;
   public $edUserName = null;
   public $Label2 = null;
   public $Label1 = null;
   function Page1Create($sender, $params)
   {
      $this->MainMenu1->Visible = false;

      global $ClientModuleDataModule1;
      $conninfo = $ClientModuleDataModule1->DSRestConnection1->ConnectionInfo;

      //$c = new TDSServerMethods($conninfo);
      //$r = $c->MVPCustomer();
      //echo "<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>";
     // var_dump($r);
      //$c->SendCustomer(json_encode($r));

   }
   function Button1Click($sender, $params)
   {

      global $ClientModuleDataModule1;
      $conninfo = $ClientModuleDataModule1->DSRestConnection1->ConnectionInfo;
//      $result['DSAuthenticationPassword']='admin';
//      $result['DSAuthenticationUser']='admin';

      $user = new TUser($conninfo);

      $valid = $user->IsValidUser($this->edUserName->Text, $this->edPassword->Text);
   //   var_dump($valid);
      echo "<br/><br/><br/><br/><br/><br/><br/><br/>";

      if($valid instanceof DSObject)
      {
         if($valid->result)
         {
            setcookie('loginid', $this->edUserName->Text);
            redirect("Main.php");
         }
         else
         {
            $this->Button1->Caption = "Username/Password invalid";

         }
      }
      else
      {
         $this->Button1->Caption = $valid->error;
      }

   }
}

global $application;

global $Page1;

//Creates the form
$Page1 = new Page1($application);

//Read from resource file
$Page1->loadResource(__FILE__);

//Shows the form
$Page1->show();

?>