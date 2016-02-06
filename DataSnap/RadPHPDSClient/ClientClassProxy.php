<?php
//
// Created by the DataSnap proxy generator.
// 2:05:48 AM
//


require_once('rpcl/rpcl.inc.php');
//Includes
use_unit('datasnap/ServerFunctionExecutor.inc.php');

class DSAdmin {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('DSAdmin',$connectionInfo);
  }


  /**
   * @return string
   */
  function GetPlatformName() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetPlatformName', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetPlatformName_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetPlatformName', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return Boolean
   */
  function ClearResources() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ClearResources', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ClearResources_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ClearResources', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function FindPackages() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('FindPackages', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function FindPackages_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('FindPackages', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $PackageName [in]
   * @param string $ClassPattern [in]
   * @return TDBXReader
   */
  function FindClasses($PackageName, $ClassPattern) {
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $returnObject = $this->executor->executeMethod('FindClasses', 'GET', array($PackageName, $ClassPattern), $params[2], true, $params[3], $params[4]);
    if (@func_get_arg(2) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->PackageName = $PackageName;
        $resultObject->ClassPattern = $ClassPattern;
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function FindClasses_URL($PackageName, $ClassPattern) {
    $func_arg=@func_get_arg(2);
    $results=$this->executor->getMethodURL('FindClasses', 'GET', array($PackageName, $ClassPattern), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $PackageName [in]
   * @param string $ClassPattern [in]
   * @param string $MethodPattern [in]
   * @return TDBXReader
   */
  function FindMethods($PackageName, $ClassPattern, $MethodPattern) {
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $returnObject = $this->executor->executeMethod('FindMethods', 'GET', array($PackageName, $ClassPattern, $MethodPattern), $params[3], true, $params[4], $params[5]);
    if (@func_get_arg(3) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->PackageName = $PackageName;
        $resultObject->ClassPattern = $ClassPattern;
        $resultObject->MethodPattern = $MethodPattern;
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function FindMethods_URL($PackageName, $ClassPattern, $MethodPattern) {
    $func_arg=@func_get_arg(3);
    $results=$this->executor->getMethodURL('FindMethods', 'GET', array($PackageName, $ClassPattern, $MethodPattern), $func_arg);
    return($results[0]);
  }

  /**
   * @param TDBXReader $ClassReader [in]
   */
  function CreateServerClasses($ClassReader) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('CreateServerClasses', 'GET', array($ClassReader), $params[1], false, $params[2], $params[3]);
  }

  /**
   * @param TDBXReader $ClassReader [in]
   */
  function DropServerClasses($ClassReader) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('DropServerClasses', 'GET', array($ClassReader), $params[1], false, $params[2], $params[3]);
  }

  /**
   * @param TDBXReader $MethodReader [in]
   */
  function CreateServerMethods($MethodReader) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('CreateServerMethods', 'GET', array($MethodReader), $params[1], false, $params[2], $params[3]);
  }

  /**
   * @param TDBXReader $MethodReader [in]
   */
  function DropServerMethods($MethodReader) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('DropServerMethods', 'GET', array($MethodReader), $params[1], false, $params[2], $params[3]);
  }

  /**
   * @return TDBXReader
   */
  function GetServerClasses() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetServerClasses', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetServerClasses_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetServerClasses', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TJSONArray
   */
  function ListClasses() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ListClasses', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListClasses_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ListClasses', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $ClassName [in]
   * @return TJSONObject
   */
  function DescribeClass($ClassName) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $returnObject = $this->executor->executeMethod('DescribeClass', 'GET', array($ClassName), $params[1], true, $params[2], $params[3]);
    if (@func_get_arg(1) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ClassName = $ClassName;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function DescribeClass_URL($ClassName) {
    $func_arg=@func_get_arg(1);
    $results=$this->executor->getMethodURL('DescribeClass', 'GET', array($ClassName), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $ClassName [in]
   * @return TJSONArray
   */
  function ListMethods($ClassName) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $returnObject = $this->executor->executeMethod('ListMethods', 'GET', array($ClassName), $params[1], true, $params[2], $params[3]);
    if (@func_get_arg(1) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ClassName = $ClassName;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListMethods_URL($ClassName) {
    $func_arg=@func_get_arg(1);
    $results=$this->executor->getMethodURL('ListMethods', 'GET', array($ClassName), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $ServerMethodName [in]
   * @return TJSONObject
   */
  function DescribeMethod($ServerMethodName) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $returnObject = $this->executor->executeMethod('DescribeMethod', 'GET', array($ServerMethodName), $params[1], true, $params[2], $params[3]);
    if (@func_get_arg(1) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ServerMethodName = $ServerMethodName;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function DescribeMethod_URL($ServerMethodName) {
    $func_arg=@func_get_arg(1);
    $results=$this->executor->getMethodURL('DescribeMethod', 'GET', array($ServerMethodName), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetServerMethods() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetServerMethods', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetServerMethods_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetServerMethods', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetServerMethodParameters() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetServerMethodParameters', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetServerMethodParameters_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetServerMethodParameters', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetDatabaseConnectionProperties() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetDatabaseConnectionProperties', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetDatabaseConnectionProperties_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetDatabaseConnectionProperties', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function GetDSServerName() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetDSServerName', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetDSServerName_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetDSServerName', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $ChannelName [in]
   * @param string $ClientManagerId [in]
   * @param string $CallbackId [in]
   * @param string $ChannelNames [in]
   * @param string $SecurityToken [in]
   * @param TJSONValue $ResponseData [in]
   * @return TJSONValue
   */
  function ConsumeClientChannel($ChannelName, $ClientManagerId, $CallbackId, $ChannelNames, $SecurityToken, $ResponseData) {
    $params[6]=@func_get_arg(6);
    $params[7]=@func_get_arg(7);
    $params[8]=@func_get_arg(8);
    $returnObject = $this->executor->executeMethod('ConsumeClientChannel', 'POST', array($ChannelName, $ClientManagerId, $CallbackId, $ChannelNames, $SecurityToken, $ResponseData), $params[6], true, $params[7], $params[8]);
    if (@func_get_arg(6) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ChannelName = $ChannelName;
        $resultObject->ClientManagerId = $ClientManagerId;
        $resultObject->CallbackId = $CallbackId;
        $resultObject->ChannelNames = $ChannelNames;
        $resultObject->SecurityToken = $SecurityToken;
        $resultObject->ResponseData = $ResponseData;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  /**
   * @param string $ChannelName [in]
   * @param string $ClientManagerId [in]
   * @param string $CallbackId [in]
   * @param string $ChannelNames [in]
   * @param string $SecurityToken [in]
   * @param Integer $Timeout [in]
   * @param TJSONValue $ResponseData [in]
   * @return TJSONValue
   */
  function ConsumeClientChannelTimeout($ChannelName, $ClientManagerId, $CallbackId, $ChannelNames, $SecurityToken, $Timeout, $ResponseData) {
    $params[7]=@func_get_arg(7);
    $params[8]=@func_get_arg(8);
    $params[9]=@func_get_arg(9);
    $returnObject = $this->executor->executeMethod('ConsumeClientChannelTimeout', 'POST', array($ChannelName, $ClientManagerId, $CallbackId, $ChannelNames, $SecurityToken, $Timeout, $ResponseData), $params[7], true, $params[8], $params[9]);
    if (@func_get_arg(7) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ChannelName = $ChannelName;
        $resultObject->ClientManagerId = $ClientManagerId;
        $resultObject->CallbackId = $CallbackId;
        $resultObject->ChannelNames = $ChannelNames;
        $resultObject->SecurityToken = $SecurityToken;
        $resultObject->Timeout = $Timeout;
        $resultObject->ResponseData = $ResponseData;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  /**
   * @param string $ChannelId [in]
   * @param string $SecurityToken [in]
   * @return Boolean
   */
  function CloseClientChannel($ChannelId, $SecurityToken) {
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $returnObject = $this->executor->executeMethod('CloseClientChannel', 'GET', array($ChannelId, $SecurityToken), $params[2], true, $params[3], $params[4]);
    if (@func_get_arg(2) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ChannelId = $ChannelId;
        $resultObject->SecurityToken = $SecurityToken;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function CloseClientChannel_URL($ChannelId, $SecurityToken) {
    $func_arg=@func_get_arg(2);
    $results=$this->executor->getMethodURL('CloseClientChannel', 'GET', array($ChannelId, $SecurityToken), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $ChannelId [in]
   * @param string $CallbackId [in]
   * @param string $ChannelNames [in]
   * @param string $SecurityToken [in]
   * @return Boolean
   */
  function RegisterClientCallbackServer($ChannelId, $CallbackId, $ChannelNames, $SecurityToken) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('RegisterClientCallbackServer', 'GET', array($ChannelId, $CallbackId, $ChannelNames, $SecurityToken), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ChannelId = $ChannelId;
        $resultObject->CallbackId = $CallbackId;
        $resultObject->ChannelNames = $ChannelNames;
        $resultObject->SecurityToken = $SecurityToken;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function RegisterClientCallbackServer_URL($ChannelId, $CallbackId, $ChannelNames, $SecurityToken) {
    $func_arg=@func_get_arg(4);
    $results=$this->executor->getMethodURL('RegisterClientCallbackServer', 'GET', array($ChannelId, $CallbackId, $ChannelNames, $SecurityToken), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $ChannelId [in]
   * @param string $CallbackId [in]
   * @param string $SecurityToken [in]
   * @return Boolean
   */
  function UnregisterClientCallback($ChannelId, $CallbackId, $SecurityToken) {
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $returnObject = $this->executor->executeMethod('UnregisterClientCallback', 'GET', array($ChannelId, $CallbackId, $SecurityToken), $params[3], true, $params[4], $params[5]);
    if (@func_get_arg(3) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ChannelId = $ChannelId;
        $resultObject->CallbackId = $CallbackId;
        $resultObject->SecurityToken = $SecurityToken;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function UnregisterClientCallback_URL($ChannelId, $CallbackId, $SecurityToken) {
    $func_arg=@func_get_arg(3);
    $results=$this->executor->getMethodURL('UnregisterClientCallback', 'GET', array($ChannelId, $CallbackId, $SecurityToken), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $ChannelName [in]
   * @param TJSONValue $Msg [in]
   * @return Boolean
   */
  function BroadcastToChannel($ChannelName, $Msg) {
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $returnObject = $this->executor->executeMethod('BroadcastToChannel', 'POST', array($ChannelName, $Msg), $params[2], true, $params[3], $params[4]);
    if (@func_get_arg(2) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ChannelName = $ChannelName;
        $resultObject->Msg = $Msg;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  /**
   * @param string $ChannelName [in]
   * @param TObject $Msg [in]
   * @return Boolean
   */
  function BroadcastObjectToChannel($ChannelName, $Msg) {
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $returnObject = $this->executor->executeMethod('BroadcastObjectToChannel', 'POST', array($ChannelName, $Msg), $params[2], true, $params[3], $params[4]);
    if (@func_get_arg(2) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ChannelName = $ChannelName;
        $resultObject->Msg = $Msg;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  /**
   * @param string $ClientId [in]
   * @param string $CallbackId [in]
   * @param TJSONValue $Msg [in]
   * @param TJSONValue $Response [out]
   * @return Boolean
   */
  function NotifyCallback($ClientId, $CallbackId, $Msg) {
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $returnObject = $this->executor->executeMethod('NotifyCallback', 'POST', array($ClientId, $CallbackId, $Msg), $params[3], true, $params[4], $params[5]);
    if (@func_get_arg(3) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ClientId = $ClientId;
        $resultObject->CallbackId = $CallbackId;
        $resultObject->Msg = $Msg;
        $resultObject->Response = $resultArray[0];
        $resultObject->result = $resultArray[1];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  /**
   * @param string $ClientId [in]
   * @param string $CallbackId [in]
   * @param TObject $Msg [in]
   * @param TObject $Response [out]
   * @return Boolean
   */
  function NotifyObject($ClientId, $CallbackId, $Msg) {
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $returnObject = $this->executor->executeMethod('NotifyObject', 'POST', array($ClientId, $CallbackId, $Msg), $params[3], true, $params[4], $params[5]);
    if (@func_get_arg(3) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ClientId = $ClientId;
        $resultObject->CallbackId = $CallbackId;
        $resultObject->Msg = $Msg;
        $resultObject->Response = $resultArray[0];
        $resultObject->result = $resultArray[1];
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TUser {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TUser',$connectionInfo);
  }


  /**
   * @param string $FirstLastName [in]
   * @param string $Login [in]
   * @param string $Password [in]
   */
  function AddUser($FirstLastName, $Login, $Password) {
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $this->executor->executeMethod('AddUser', 'GET', array($FirstLastName, $Login, $Password), $params[3], false, $params[4], $params[5]);
  }

  function AddUser_URL($FirstLastName, $Login, $Password) {
    $func_arg=@func_get_arg(3);
    $results=$this->executor->getMethodURL('AddUser', 'GET', array($FirstLastName, $Login, $Password), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $Login [in]
   * @param string $Password [in]
   * @return Boolean
   */
  function IsValidUser($Login, $Password) {
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $params[4]=@func_get_arg(4);
    $returnObject = $this->executor->executeMethod('IsValidUser', 'GET', array($Login, $Password), $params[2], true, $params[3], $params[4]);
    if (@func_get_arg(2) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->Login = $Login;
        $resultObject->Password = $Password;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function IsValidUser_URL($Login, $Password) {
    $func_arg=@func_get_arg(2);
    $results=$this->executor->getMethodURL('IsValidUser', 'GET', array($Login, $Password), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $Login [in]
   */
  function DisableUser($Login) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('DisableUser', 'GET', array($Login), $params[1], false, $params[2], $params[3]);
  }

  function DisableUser_URL($Login) {
    $func_arg=@func_get_arg(1);
    $results=$this->executor->getMethodURL('DisableUser', 'GET', array($Login), $func_arg);
    return($results[0]);
  }

  /**
   * @param string $Login [in]
   */
  function EnableUser($Login) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('EnableUser', 'GET', array($Login), $params[1], false, $params[2], $params[3]);
  }

  function EnableUser_URL($Login) {
    $func_arg=@func_get_arg(1);
    $results=$this->executor->getMethodURL('EnableUser', 'GET', array($Login), $func_arg);
    return($results[0]);
  }
}

class TEmployeeServerRDM {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TEmployeeServerRDM',$connectionInfo);
  }


  /**
   * @param TObject $Sender [in]
   */
  function DSServerModuleCreate($Sender) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('DSServerModuleCreate', 'GET', array($Sender), $params[1], false, $params[2], $params[3]);
  }

  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDSServerMethods {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDSServerMethods',$connectionInfo);
  }


  /**
   * @param TObject $Sender [in]
   */
  function DSServerModuleCreate($Sender) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('DSServerModuleCreate', 'GET', array($Sender), $params[1], false, $params[2], $params[3]);
  }

  /**
   * @return TDateTime
   */
  function GetServerDateTime() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetServerDateTime', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetServerDateTime_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetServerDateTime', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param Integer $JobId [in]
   */
  function ExecuteJob($JobId) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('ExecuteJob', 'GET', array($JobId), $params[1], false, $params[2], $params[3]);
  }

  function ExecuteJob_URL($JobId) {
    $func_arg=@func_get_arg(1);
    $results=$this->executor->getMethodURL('ExecuteJob', 'GET', array($JobId), $func_arg);
    return($results[0]);
  }

  /**
   * @return TJSONValue
   */
  function MVPCustomer() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('MVPCustomer', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function MVPCustomer_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('MVPCustomer', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TCustomer
   */
  function Customer() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('Customer', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function Customer_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('Customer', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param TJSONObject $C [in]
   */
  function SendCustomer($C) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('SendCustomer', 'GET', array($C), $params[1], false, $params[2], $params[3]);
  }

  /**
   * @return TJSONArray
   */
  function ListofCustomer() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ListofCustomer', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListofCustomer_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ListofCustomer', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TJSONArray
   */
  function ListofDifferentTypes() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ListofDifferentTypes', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListofDifferentTypes_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ListofDifferentTypes', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDMMainServerModule {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDMMainServerModule',$connectionInfo);
  }


  /**
   * @return string
   */
  function IpAddress() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('IpAddress', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function IpAddress_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('IpAddress', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function ServerComputerName() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ServerComputerName', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ServerComputerName_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ServerComputerName', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TLookupServerRDM {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TLookupServerRDM',$connectionInfo);
  }


  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDepartment {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDepartment',$connectionInfo);
  }


  function DepartmentDefault() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $this->executor->executeMethod('DepartmentDefault', 'GET', array(), $params[0], false, $params[1], $params[2]);
  }

  function DepartmentDefault_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('DepartmentDefault', 'GET', array(), $func_arg);
    return($results[0]);
  }

  function DepartmentOrderByID() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $this->executor->executeMethod('DepartmentOrderByID', 'GET', array(), $params[0], false, $params[1], $params[2]);
  }

  function DepartmentOrderByID_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('DepartmentOrderByID', 'GET', array(), $func_arg);
    return($results[0]);
  }

  function DepartmentOrderByName() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $this->executor->executeMethod('DepartmentOrderByName', 'GET', array(), $params[0], false, $params[1], $params[2]);
  }

  function DepartmentOrderByName_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('DepartmentOrderByName', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function OrderByField() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('OrderByField', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function OrderByField_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('OrderByField', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetDepartmentsOrderBy() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetDepartmentsOrderBy', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetDepartmentsOrderBy_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetDepartmentsOrderBy', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetDepartments() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetDepartments', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetDepartments_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetDepartments', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetBioLife() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetBioLife', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetBioLife_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetBioLife', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param TParams $sParams [in]
   * @return Boolean
   */
  function Insert($sParams) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $returnObject = $this->executor->executeMethod('Insert', 'GET', array($sParams), $params[1], true, $params[2], $params[3]);
    if (@func_get_arg(1) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->sParams = $sParams;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  /**
   * @param TDBXReader $sDbxParams [in]
   * @return Boolean
   */
  function InsertAsDBXReader($sDbxParams) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $returnObject = $this->executor->executeMethod('InsertAsDBXReader', 'GET', array($sDbxParams), $params[1], true, $params[2], $params[3]);
    if (@func_get_arg(1) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->sDbxParams = $sDbxParams;
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  /**
   * @param string $i [in]
   */
  function SendValue($i) {
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $params[3]=@func_get_arg(3);
    $this->executor->executeMethod('SendValue', 'GET', array($i), $params[1], false, $params[2], $params[3]);
  }

  function SendValue_URL($i) {
    $func_arg=@func_get_arg(1);
    $results=$this->executor->getMethodURL('SendValue', 'GET', array($i), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function GetValue() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetValue', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetValue_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetValue', 'GET', array(), $func_arg);
    return($results[0]);
  }
}

class TDSServerBatch {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDSServerBatch',$connectionInfo);
  }


  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDSMasterDetail {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDSMasterDetail',$connectionInfo);
  }


  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDMDataSet1 {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDMDataSet1',$connectionInfo);
  }


  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDMDataSet2 {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDMDataSet2',$connectionInfo);
  }


  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDMDataSet3 {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDMDataSet3',$connectionInfo);
  }


  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDMDataSet5 {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDMDataSet5',$connectionInfo);
  }


  /**
   * @return TDBXReader
   */
  function GetRegion() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetRegion', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetRegion_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetRegion', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetCountry() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetCountry', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetCountry_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetCountry', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetState() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetState', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetState_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetState', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TDBXReader
   */
  function GetCity() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetCity', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetCity_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetCity', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TJSONArray
   */
  function ListofClassRegion() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ListofClassRegion', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListofClassRegion_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ListofClassRegion', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TJSONArray
   */
  function ListofClassCountry() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ListofClassCountry', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListofClassCountry_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ListofClassCountry', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TJSONArray
   */
  function ListofClassState() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ListofClassState', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListofClassState_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ListofClassState', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return TJSONArray
   */
  function ListofClassCity() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('ListofClassCity', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function ListofClassCity_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('ListofClassCity', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

class TDMDataSet6 {
  public $executor=null;

  function __construct($connectionInfo) {
    $this->executor = new ServerFunctionExecutor('TDMDataSet6',$connectionInfo);
  }


  /**
   * @return TDBXReader
   */
  function GetDepartments() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('GetDepartments', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function GetDepartments_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('GetDepartments', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @return string
   */
  function AS_GetProviderNames() {
    $params[0]=@func_get_arg(0);
    $params[1]=@func_get_arg(1);
    $params[2]=@func_get_arg(2);
    $returnObject = $this->executor->executeMethod('AS_GetProviderNames', 'GET', array(), $params[0], true, $params[1], $params[2]);
    if (@func_get_arg(0) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->result = $resultArray[0];
        return $resultObject;
      }
      return $returnObject;
    }
  }

  function AS_GetProviderNames_URL() {
    $func_arg=@func_get_arg(0);
    $results=$this->executor->getMethodURL('AS_GetProviderNames', 'GET', array(), $func_arg);
    return($results[0]);
  }

  /**
   * @param WideString $ProviderName [in]
   * @param WideString $CommandText [in]
   * @param TDBXStreamValue $ParamReader [in/out]
   * @param TDBXStreamValue $OwnerDataStream [in/out]
   */
  function AS_Execute($ProviderName, $CommandText, $ParamReader, $OwnerDataStream) {
    $params[4]=@func_get_arg(4);
    $params[5]=@func_get_arg(5);
    $params[6]=@func_get_arg(6);
    $returnObject = $this->executor->executeMethod('AS_Execute', 'GET', array($ProviderName, $CommandText, $ParamReader, $OwnerDataStream), $params[4], true, $params[5], $params[6]);
    if (@func_get_arg(4) === FALSE) {
      if (($returnObject != null) && ($returnObject->result != null) && (is_array($returnObject->result))) {
        $resultArray = $returnObject->result;
        $resultObject=new DSObject();
        $resultObject->ProviderName = $ProviderName;
        $resultObject->CommandText = $CommandText;
        $resultObject->ParamReader = $resultArray[0];
        $resultObject->OwnerDataStream = $resultArray[1];
        if (($returnObject->cacheId != ') && ($returnObject->cmdIndex != ')) {
          $resultObject->_cacheId = $returnObject->cacheId;
          $resultObject->_cmdIndex = $returnObject->cmdIndex;
        }
        return $resultObject;
      }
      return $returnObject;
    }
  }
}

global $PHPProxyClassList;
$PHPProxyClassList = array(
  'DSAdmin'=>array('GetPlatformName','ClearResources','FindPackages','FindClasses','FindMethods','CreateServerClasses','DropServerClasses','CreateServerMethods','DropServerMethods','GetServerClasses','ListClasses','DescribeClass','ListMethods','DescribeMethod','GetServerMethods','GetServerMethodParameters','GetDatabaseConnectionProperties','GetDSServerName','ConsumeClientChannel','ConsumeClientChannelTimeout','CloseClientChannel','RegisterClientCallbackServer','UnregisterClientCallback','BroadcastToChannel','BroadcastObjectToChannel','NotifyCallback','NotifyObject'),
  'TUser'=>array('AddUser','IsValidUser','DisableUser','EnableUser'),
  'TEmployeeServerRDM'=>array('DSServerModuleCreate','AS_GetProviderNames','AS_Execute'),
  'TDSServerMethods'=>array('DSServerModuleCreate','GetServerDateTime','ExecuteJob','MVPCustomer','Customer','SendCustomer','ListofCustomer','ListofDifferentTypes','AS_GetProviderNames','AS_Execute'),
  'TDMMainServerModule'=>array('IpAddress','ServerComputerName','AS_GetProviderNames','AS_Execute'),
  'TLookupServerRDM'=>array('AS_GetProviderNames','AS_Execute'),
  'TDepartment'=>array('DepartmentDefault','DepartmentOrderByID','DepartmentOrderByName','OrderByField','GetDepartmentsOrderBy','GetDepartments','GetBioLife','Insert','InsertAsDBXReader','SendValue','GetValue'),
  'TDSServerBatch'=>array('AS_GetProviderNames','AS_Execute'),
  'TDSMasterDetail'=>array('AS_GetProviderNames','AS_Execute'),
  'TDMDataSet1'=>array('AS_GetProviderNames','AS_Execute'),
  'TDMDataSet2'=>array('AS_GetProviderNames','AS_Execute'),
  'TDMDataSet3'=>array('AS_GetProviderNames','AS_Execute'),
  'TDMDataSet5'=>array('GetRegion','GetCountry','GetState','GetCity','ListofClassRegion','ListofClassCountry','ListofClassState','ListofClassCity','AS_GetProviderNames','AS_Execute'),
  'TDMDataSet6'=>array('GetDepartments','AS_GetProviderNames','AS_Execute')
);

