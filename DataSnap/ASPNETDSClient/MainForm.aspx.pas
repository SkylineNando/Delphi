namespace DataSnapdotnetClient;

interface

uses
  System,
  System.Configuration,
  System.Data,
  System.Data.Common,
  System.Configuration,
  System.Web,
  System.Web.Security,
  System.Web.SessionState,
  System.Web.UI,
  System.Web.UI.WebControls,
  System.Web.UI.WebControls.WebParts,
  System.Web.UI.HtmlControls,
  Borland.Data.*;

type
  MainForm = public partial class(System.Web.UI.Page)
  protected
    method Button1_Click(sender: System.Object; e: System.EventArgs);
    method ButtonSend_Click(sender: System.Object; e: System.EventArgs);
    method ButtonParams_Click(sender: System.Object; e: System.EventArgs);
    method Button2_Click(sender: System.Object; e: System.EventArgs);
    method Page_Load(sender: Object; e: EventArgs);
  public
    function CreateDataTable(ARowCount: Integer): DataTable;
  end;

implementation

method MainForm.Page_Load(sender: Object; e: EventArgs);
begin
end;

method MainForm.Button2_Click(sender: System.Object; e: System.EventArgs);
var
  conn : TAdoDbxConnection;
begin

  if IsPostBack then
  begin

    conn := DbxConn.Get(tbUsername.Text, tbPassword.Text);
    try
      conn.Open;
      cvUser.Text := 'User authorized'; 
    except
      on ee : Exception do begin
        cvUser.Text := ee.Message;
     end;
    finally
      conn.Close;
    end;
    cvUser.DataBind;
  end;
end;

function MainForm.CreateDataTable(ARowCount: Integer): DataTable;
var
  LDataTable: DataTable;
begin

  LDataTable := new DataTable;
  LDataTable.Columns.Add('DEPARTMENT', typeof(string));
  LDataTable.Columns.Add('HEAD_DEPT', typeof(string));
  LDataTable.Columns.Add('MNGR_NO', typeof(string));
  LDataTable.Columns.Add('BUDGET', typeof(Int32));
  LDataTable.Columns.Add('LOCATION', typeof(string));
  LDataTable.Columns.Add('PHONE_NO', typeof(string));

  LDataTable.Rows.Add([ 'New .NET Department', '000', '105', 100000, 'Scotts Valley', 'N/A']);

  LDataTable.AcceptChanges;

  Result := LDataTable;

end;

method MainForm.ButtonParams_Click(sender: System.Object; e: System.EventArgs);
var
  cmd : DbCommand;
  conn : TAdoDbxConnection;
  reader : DbDataReader;
  sb : System.Text.StringBuilder;
  dep : TDepartmentClient;
begin

  if IsPostBack then
  begin
    conn := DbxConn.Get(tbUsername.Text, tbPassword.Text);

    sb := new System.Text.StringBuilder();

    dep := new TDepartmentClient(conn);

    try
      reader := dep.GetDepartmentsOrderBy as DbDataReader;
      cvUser.Text := '';

      if reader <> nil then
      begin
        while reader.Read do begin
             sb.Append( reader.GetInt32(0).toString + ' -  ' +
                      reader.GetString(1).toString + '<br/>').AppendLine;
        end;
      end;
      GridPanel.Text := sb.ToString();

      conn.Close;
    except
      on ee : Exception do begin
        cvUser.Text := ee.Message;
     end;
    finally
      conn.Close;
    end;

    Databind;
  end;    
end;

method MainForm.ButtonSend_Click(sender: System.Object; e: System.EventArgs);
var
  conn : TAdoDbxConnection;
  sb : System.Text.StringBuilder;
  newDep : TDepartmentClient;
begin
  if IsPostBack then
  begin
    conn := DbxConn.Get(tbUsername.Text, tbPassword.Text);

    sb := new System.Text.StringBuilder();
    try
      newDep := new TDepartmentClient(conn);
      newDep.Insert( new DataTableReader(CreateDataTable(1)) );
    except
      on ee : Exception do begin
        cvUser.Text := ee.Message;
      end;
    finally
      conn.Close;
    end;
    DataBind;
  end;
end;
 
method MainForm.Button1_Click(sender: System.Object; e: System.EventArgs);
var
  datasource :SqlDataSource;
begin
  if isPostBack then
  begin
    try 
      datasource := new SqlDataSource();
      datasource.ConnectionString := DbxConn.Get(tbUsername.Text, tbPassword.Text).ConnectionString;
      datasource.SelectCommand := 'TDepartment.GetDepartmentsOrderBy';
      datasource.SelectCommandType := SqlDataSourceCommandType.StoredProcedure;
      datasource.ProviderName :=  ConfigurationManager.AppSettings['ProviderName'];
      GridView1.DataSource := datasource;
      cvUser.Text := '';
      DataBind;

    except
      on ee : Exception do begin
        cvUser.Text := ee.Message;
     end;
    end;

  end;
  
end;

end.

