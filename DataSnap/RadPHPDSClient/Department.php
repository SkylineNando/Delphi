<?php
require_once("rpcl/rpcl.inc.php");
require_once("MasterPage.php");
require_once("ClientClassProxy.php");
require_once("ClientModuleProxy.php");
//Includes
use_unit("forms.inc.php");
use_unit("extctrls.inc.php");
use_unit("stdctrls.inc.php");
use_unit("dbctrls.inc.php");

//Class definition
class PageDepartment extends MasterPage
{
    public $Panel1 = null;
    function Panel1AfterShow($sender, $params)
    {
       global $ClientModuleDataModule1;

      $reader = $ClientModuleDataModule1->readDepartmentClient()->GetDepartmentsOrderBy();

      echo "<table border=0 width=100%>" . chr(13) . chr(10);
      echo "<tbody align='center' style='font-family:verdana; color:purple; font-size:12px; background-color:yellow'>";

      echo "  <tr>" . chr(13) . chr(10);

      // Create the columns
      foreach($reader->result->table as $value)
      {
         echo "   <td>" . $value[0] . "</td>" . chr(13) . chr(10);
      }
      echo "  </tr>" . chr(13) . chr(10);

      $i = 0;

      while($i < count($reader->result->DEPARTMENT))
      {
         echo "  <tr>" . chr(13) . chr(10);
         echo "   <td>" . $reader->result->DEPT_NO[$i] . "</td>" . chr(13) . chr(10);
         echo "   <td>" . $reader->result->DEPARTMENT[$i] . "</td>" . chr(13) . chr(10);
         echo "   <td>" . $reader->result->HEAD_DEPT[$i] . "</td>" . chr(13) . chr(10);
         echo "   <td>" . $reader->result->MNGR_NO[$i] . "</td>" . chr(13) . chr(10);
         echo "   <td>" . $reader->result->BUDGET[$i] . "</td>" . chr(13) . chr(10);
         echo "   <td>" . $reader->result->LOCATION[$i] . "</td>" . chr(13) . chr(10);
         echo "   <td>" . $reader->result->PHONE_NO[$i] . "</td>" . chr(13) . chr(10);
         echo "  </tr>" . chr(13) . chr(10);
         $i++;
      }
      echo "</table><br/><br/>" . chr(13) . chr(10);

    }
}

global $application;

global $PageDepartment;

//Creates the form
$PageDepartment = new PageDepartment($application);

//Read from resource file
$PageDepartment->loadResource(__FILE__);

//Shows the form
$PageDepartment->show();

?>
