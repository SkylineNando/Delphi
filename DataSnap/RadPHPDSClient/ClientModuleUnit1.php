<?php
require_once("rpcl/rpcl.inc.php");
require_once("ClientClassUnit7.php");
//Includes
use_unit("forms.inc.php");
use_unit("extctrls.inc.php");
use_unit("stdctrls.inc.php");
use_unit("datasnap/datasnap.inc.php");

//Class definition
class ClientModuleDataModule1 extends DataModule
{
    protected $_dmdataset6client=null;
    public $DSRestConnection1 = null;

    /**
    * @return TDMDataSet6
    */
    function readDMDataSet6Client() {
      if ($this->_dmdataset6client == null) $this->_dmdataset6client = new TDMDataSet6($this->DSRestConnection1->ConnectionInfo);
      return $this->_dmdataset6client;
    }
    function writeDMDataSet6Client($value) { $this->_dmdataset6client=$value; }
    protected $_dmdataset5client=null;

    /**
    * @return TDMDataSet5
    */
    function readDMDataSet5Client() {
      if ($this->_dmdataset5client == null) $this->_dmdataset5client = new TDMDataSet5($this->DSRestConnection1->ConnectionInfo);
      return $this->_dmdataset5client;
    }
    function writeDMDataSet5Client($value) { $this->_dmdataset5client=$value; }
    protected $_dmdataset3client=null;

    /**
    * @return TDMDataSet3
    */
    function readDMDataSet3Client() {
      if ($this->_dmdataset3client == null) $this->_dmdataset3client = new TDMDataSet3($this->DSRestConnection1->ConnectionInfo);
      return $this->_dmdataset3client;
    }
    function writeDMDataSet3Client($value) { $this->_dmdataset3client=$value; }
    protected $_dmdataset2client=null;

    /**
    * @return TDMDataSet2
    */
    function readDMDataSet2Client() {
      if ($this->_dmdataset2client == null) $this->_dmdataset2client = new TDMDataSet2($this->DSRestConnection1->ConnectionInfo);
      return $this->_dmdataset2client;
    }
    function writeDMDataSet2Client($value) { $this->_dmdataset2client=$value; }
    protected $_dmdataset1client=null;

    /**
    * @return TDMDataSet1
    */
    function readDMDataSet1Client() {
      if ($this->_dmdataset1client == null) $this->_dmdataset1client = new TDMDataSet1($this->DSRestConnection1->ConnectionInfo);
      return $this->_dmdataset1client;
    }
    function writeDMDataSet1Client($value) { $this->_dmdataset1client=$value; }
    protected $_dsmasterdetailclient=null;

    /**
    * @return TDSMasterDetail
    */
    function readDSMasterDetailClient() {
      if ($this->_dsmasterdetailclient == null) $this->_dsmasterdetailclient = new TDSMasterDetail($this->DSRestConnection1->ConnectionInfo);
      return $this->_dsmasterdetailclient;
    }
    function writeDSMasterDetailClient($value) { $this->_dsmasterdetailclient=$value; }
    protected $_dsserverbatchclient=null;

    /**
    * @return TDSServerBatch
    */
    function readDSServerBatchClient() {
      if ($this->_dsserverbatchclient == null) $this->_dsserverbatchclient = new TDSServerBatch($this->DSRestConnection1->ConnectionInfo);
      return $this->_dsserverbatchclient;
    }
    function writeDSServerBatchClient($value) { $this->_dsserverbatchclient=$value; }
    protected $_departmentclient=null;

    /**
    * @return TDepartment
    */
    function readDepartmentClient() {
      if ($this->_departmentclient == null) $this->_departmentclient = new TDepartment($this->DSRestConnection1->ConnectionInfo);
      return $this->_departmentclient;
    }
    function writeDepartmentClient($value) { $this->_departmentclient=$value; }
    protected $_lookupserverrdmclient=null;

    /**
    * @return TLookupServerRDM
    */
    function readLookupServerRDMClient() {
      if ($this->_lookupserverrdmclient == null) $this->_lookupserverrdmclient = new TLookupServerRDM($this->DSRestConnection1->ConnectionInfo);
      return $this->_lookupserverrdmclient;
    }
    function writeLookupServerRDMClient($value) { $this->_lookupserverrdmclient=$value; }
    protected $_dmmainservermoduleclient=null;

    /**
    * @return TDMMainServerModule
    */
    function readDMMainServerModuleClient() {
      if ($this->_dmmainservermoduleclient == null) $this->_dmmainservermoduleclient = new TDMMainServerModule($this->DSRestConnection1->ConnectionInfo);
      return $this->_dmmainservermoduleclient;
    }
    function writeDMMainServerModuleClient($value) { $this->_dmmainservermoduleclient=$value; }
    protected $_dsservermethodsclient=null;

    /**
    * @return TDSServerMethods
    */
    function readDSServerMethodsClient() {
      if ($this->_dsservermethodsclient == null) $this->_dsservermethodsclient = new TDSServerMethods($this->DSRestConnection1->ConnectionInfo);
      return $this->_dsservermethodsclient;
    }
    function writeDSServerMethodsClient($value) { $this->_dsservermethodsclient=$value; }
    protected $_employeeserverrdmclient=null;

    /**
    * @return TEmployeeServerRDM
    */
    function readEmployeeServerRDMClient() {
      if ($this->_employeeserverrdmclient == null) $this->_employeeserverrdmclient = new TEmployeeServerRDM($this->DSRestConnection1->ConnectionInfo);
      return $this->_employeeserverrdmclient;
    }
    function writeEmployeeServerRDMClient($value) { $this->_employeeserverrdmclient=$value; }
    protected $_userclient=null;

    /**
    * @return TUser
    */
    function readUserClient() {
      if ($this->_userclient == null) $this->_userclient = new TUser($this->DSRestConnection1->ConnectionInfo);
      return $this->_userclient;
    }
    function writeUserClient($value) { $this->_userclient=$value; }

}

global $application;

global $ClientModuleDataModule1;

//Creates the form
$ClientModuleDataModule1=new ClientModuleDataModule1($application);

//Read from resource file
$ClientModuleDataModule1->loadResource(__FILE__);

?>
