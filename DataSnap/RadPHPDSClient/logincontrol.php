<?php

class LoginControl
{
   function isAuthenticated()
   {
      global $BlogDB;

      $loginid = $_COOKIE['loginid'];

      if( ! empty($loginid) && preg_match('/^[a-z0-9]{1,}$/i', $loginid))
      {
         return true;
      }
      else
      {
         return false;
      }
   }
}

global $LoginControl;

$LoginControl = new LoginControl();

function GetLoginControl()
{
   global $LoginControl;

   return $LoginControl;
}
?>