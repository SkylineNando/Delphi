namespace ;

interface

uses
  System;
// XMLsample.cs
// compile with: /doc:XMLsample.xml

/// <summary>
/// Class level summary documentation goes here.</summary>
/// <remarks>
/// Longer comments can be associated with a type or member 
/// through the remarks tag</remarks>
  SomeClass = public class
/// <summary>
/// Store for the name property</summary>
  private
    var     myName: System.String := nil;

/// <summary>
/// The class constructor. </summary>
  public
    constructor ;

/// <summary>
/// Name property </summary>
/// <value>
/// A value tag is used to describe the property value</value>
    property Name: System.String read get_Name;
    method get_Name: System.String;

/// <summary>
/// Description for SomeMethod.</summary>
/// <param name="s"> Parameter description for s goes here</param>
/// <seealso cref="String">
/// You can use the cref attribute on any tag to reference a type or member 
/// and the compiler will check that the reference exists. </seealso>
    method SomeMethod(s: System.String);

/// <summary>
/// Some other method. </summary>
/// <returns>
/// Return results are described through the returns tag.</returns>
/// <seealso cref="SomeMethod(string)">
/// Notice the use of the cref attribute to reference a specific method </seealso>
    method SomeOtherMethod: System.Int32;

/// <summary>
/// The entry point for the application.
/// </summary>
/// <param name="args"> A list of command line arguments</param>
    class method Main(args: array of String): System.Int32;
  end;


implementation


constructor SomeClass;
begin

// TODO: Add Constructor Logic here
end;

method SomeClass.get_Name: System.String; begin
  if myName = nil then begin
    raise new Exception('Name is null')
  end;

  exit myName
end;

method SomeClass.SomeMethod(s: System.String);
begin
end;

method SomeClass.SomeOtherMethod: System.Int32;
begin
  exit 0
end;

class method SomeClass.Main(args: array of String): System.Int32;
begin
// TODO: Add code to start application here

  exit 0
end;

end.
