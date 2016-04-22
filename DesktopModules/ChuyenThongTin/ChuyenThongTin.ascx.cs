using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using VNPT.Modules.Employees;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DevExpress.Web.ASPxEditors;
using DotNetNuke.Entities.Modules;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxHiddenField;
using VNPT.Modules.RewardDiscipline;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxGridView;
using System.Globalization;
using DevExpress.XtraReports.UI;
using DevExpress.XtraReports.Web;
using DevExpress.Web.ASPxRoundPanel;

using VNPT.Modules.FamilyRelationship;
using System.Collections;

namespace DotNetNuke.Modules.ChuyenThongTin
{
    public partial class ChuyenThongTin : PortalModuleBase, IActionable
    {
        VNPT.Modules.Relationship.RelationshipController objRelation = new VNPT.Modules.Relationship.RelationshipController();
        FamilyRelationshipController frController = new FamilyRelationshipController();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadComboBox(cbbSource);
            LoadComboBox(cbbDest);
        }

        private void LoadComboBox(ASPxComboBox cbb)
        {
            cbb.DataSource = SearchEmp(0, 0);
            cbb.DataBind();
        }

        public DataTable SearchEmp(int NunitId, int Noption)
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
            SqlDataReader Dr;

            Cmd = new SqlCommand("[HRM_GetEmployeesSearch]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter unitid = Cmd.Parameters.Add("@unitid", SqlDbType.Int, 20);
            unitid.Value = NunitId;
            SqlParameter option = Cmd.Parameters.Add("@option", SqlDbType.Int, 20);
            option.Value = Noption;
            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();

            Col = new DataColumn("id");
            Table.Columns.Add(Col);
            Col = new DataColumn("fullname");
            Table.Columns.Add(Col);
            Col = new DataColumn("empcode");
            Table.Columns.Add(Col);
            Col = new DataColumn("name");
            Table.Columns.Add(Col);
            Col = new DataColumn("dvcha");
            Table.Columns.Add(Col);

            while (Dr.Read())
            {
                Row = Table.NewRow();
                Row[0] = Dr["id"].ToString();
                Row[1] = Dr["fullname"].ToString();
                Row[2] = Dr["empcode"].ToString();
                Row[3] = Dr["name"].ToString();
                Row[4] = Dr["dvcha"].ToString();
                Table.Rows.Add(Row);
            }
            Dr.Close();
            Cnn.Close();
            return Table;
        }

        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                Entities.Modules.Actions.ModuleActionCollection Actions = new Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }
        protected void cbpnGiadinh_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            var cbpnGiadinh = sender as ASPxCallbackPanel;
            bool bChong = rbChong.Checked;

            List<FamilyRelationshipInfo> frListS1 = null;
            List<FamilyRelationshipInfo> frListS2 = null;
            List<FamilyRelationshipInfo> frListS3 = null;
            List<FamilyRelationshipInfo> frListS = null;

            List<FamilyRelationshipInfo> frListD1 = null;
            List<FamilyRelationshipInfo> frListD2 = null;
            List<FamilyRelationshipInfo> frListD3 = null;
            List<FamilyRelationshipInfo> frListD = null;
            int nhanvienDich = 0;
            int nhanvienNguon = 0;
            if (cbbSource.SelectedIndex != -1)
            {
                nhanvienNguon = Convert.ToInt32(cbbSource.SelectedItem.Value);
                frListS1 = frController.GetFamilyByEmployess(nhanvienNguon, 1);
                frListS2 = frController.GetFamilyByEmployess(nhanvienNguon, 2);
                frListS3 = frController.GetFamilyByEmployess(nhanvienNguon, 3);
                frListS = frListS1.Union(frListS2).Union(frListS3).ToList();
            }
            if (cbbDest.SelectedIndex != -1)
            {
                nhanvienDich = Convert.ToInt32(cbbDest.SelectedItem.Value);
                frListD1 = frController.GetFamilyByEmployess(nhanvienDich, 1);
                frListD2 = frController.GetFamilyByEmployess(nhanvienDich, 2);
                frListD3 = frController.GetFamilyByEmployess(nhanvienDich, 3);
                frListD = frListD1.Union(frListD2).Union(frListD3).ToList();
            }
            if (e.Parameter.StartsWith("TransferSelectedItem"))
            {
                if (frListD == null)
                    frListD = new List<FamilyRelationshipInfo>();

                var tempS = new List<FamilyRelationshipInfo>();
                var tempD = new List<FamilyRelationshipInfo>();

                string sourceItems = e.Parameter.Split(':')[1];
                string destItems = e.Parameter.Split(':')[2];
                string allItem = sourceItems + destItems;

                var tempList = frListS.ToList();
                RemoveUnMap(tempList, frListD, bChong);

                foreach (string item in allItem.Split(','))
                {
                    if (string.IsNullOrEmpty(item))
                        continue;
                    int rid = Convert.ToInt32(item);
                    var ritem = tempList.Where(r => r.id == rid).FirstOrDefault();
                    if (ritem != null)
                    {
                        tempD.Add(ritem);
                    }
                }

                for (int i = 0; i < tempD.Count; i++)
                {
                    var ri = tempD[i];
                    int mrid = MapRelationshipId(ri.relationshipid, bChong);
                    if (mrid == 0)
                    {
                        tempD.Remove(ri);
                    }
                    else
                    {
                        frListS.Remove(ri);
                        ri.description = objRelation.GetRelationship(mrid).name;
                    }
                }
                foreach (var ri in frListD)
                {
                    ri.description = objRelation.GetRelationship(ri.relationshipid).name;
                }

                frListD = frListD.Union(tempD).ToList();
                lbRelativeDest.DataSource = frListD;
                lbRelativeDest.DataBind();

                foreach (var ri in frListS)
                {
                    ri.description = objRelation.GetRelationship(ri.relationshipid).name;
                }
                lbRelativeSource.DataSource = frListS;
                lbRelativeSource.DataBind();

                cbpnGiadinh.JSProperties["cpOP"] = 0;
            }
            else if (e.Parameter.StartsWith("RemoveSelectedItem"))
            {
                if (frListD == null)
                    frListD = new List<FamilyRelationshipInfo>();

                var tempS = new List<FamilyRelationshipInfo>();
                var tempD = new List<FamilyRelationshipInfo>();

                string sourceItems = e.Parameter.Split(':')[1];
                string destRemoveItems = e.Parameter.Split(':')[2];
                string destItems = e.Parameter.Split(':')[3];
                string allItem = sourceItems + destItems;

                List<int> tempSrcIdList = new List<int>();
                List<int> tempDestRemoveIdList = new List<int>();
                List<int> tempDestAllIdList = new List<int>();

                foreach (var strItem in sourceItems.Split(','))
                {
                    if (string.IsNullOrEmpty(strItem))
                        continue;
                    int id = Convert.ToInt32(strItem);
                    var item = frListS.Where(r => r.id == id).FirstOrDefault();
                    if (item != null)
                    {
                        tempSrcIdList.Add(id);
                    }
                }

                foreach (var strItem in destRemoveItems.Split(','))
                {
                    if (string.IsNullOrEmpty(strItem))
                        continue;
                    int id = Convert.ToInt32(strItem);
                    var item = frListD.Where(r => r.id == id).FirstOrDefault();
                    if (item == null)
                    {
                        tempDestRemoveIdList.Add(id);
                    }
                }

                foreach (var strItem in destItems.Split(','))
                {
                    if (string.IsNullOrEmpty(strItem))
                        continue;
                    int id = Convert.ToInt32(strItem);
                    var item = frListD.Where(r => r.id == id).FirstOrDefault();
                    if (item == null)
                    {
                        tempDestAllIdList.Add(id);
                    }
                }

                tempSrcIdList = tempSrcIdList.Union(tempDestRemoveIdList).ToList();
                tempDestAllIdList = tempDestAllIdList.Except(tempDestRemoveIdList).ToList();

                foreach (var id in tempSrcIdList)
                {
                    var ri = frController.GetFamilyRelationship(id);
                    ri.description = objRelation.GetRelationship(ri.relationshipid).name;
                    tempS.Add(ri);
                }

                foreach (var id in tempDestAllIdList)
                {
                    var ri = frController.GetFamilyRelationship(id);
                    int mrid = MapRelationshipId(ri.relationshipid, bChong);
                    ri.description = objRelation.GetRelationship(mrid).name;
                    tempD.Add(ri);
                }

                lbRelativeSource.DataSource = tempS;
                lbRelativeSource.DataBind();

                foreach (var ri in frListD)
                {
                    ri.description = objRelation.GetRelationship(ri.relationshipid).name;
                }

                frListD = frListD.Union(tempD).ToList();
                lbRelativeDest.DataSource = frListD;
                lbRelativeDest.DataBind();
            }
            else if (e.Parameter.StartsWith("LR"))
            {
                if (frListS != null)
                {
                    foreach (var ri in frListS)
                    {
                        ri.description = objRelation.GetRelationship(ri.relationshipid).name;
                    }
                    lbRelativeSource.DataSource = frListS;
                    lbRelativeSource.DataBind();
                }
                if (frListD != null)
                {
                    foreach (var ri in frListD)
                    {
                        ri.description = objRelation.GetRelationship(ri.relationshipid).name;
                    }
                    lbRelativeDest.DataSource = frListD;
                    lbRelativeDest.DataBind();
                }
                cbpnGiadinh.JSProperties["cpOP"] = 0;
            }
            else if (e.Parameter.StartsWith("Save"))
            {
                try
                {
                    if (frListS == null)
                        return;
                    if (frListD == null)
                    {
                        frListD = new List<FamilyRelationshipInfo>();
                    }

                    string destItems = e.Parameter.Split(':')[1];
                    var tempList = new List<FamilyRelationshipInfo>();

                    List<int> frDestIdList = new List<int>();


                    foreach (string stritem in destItems.Split(','))
                    {
                        if (string.IsNullOrEmpty(stritem))
                            continue;
                        int id = Convert.ToInt32(stritem);
                        var item = frListD.Where(r => r.id == id).FirstOrDefault();
                        if (item == null)
                        {
                            frDestIdList.Add(id);
                        }
                    }

                    foreach (var id in frDestIdList)
                    {
                        var item = frController.GetFamilyRelationship(id);
                        int rid = MapRelationshipId(item.relationshipid, bChong);
                        if (rid == 0) continue;
                        item.relationshipid = rid;
                        item.employeeid = nhanvienDich;
                        frController.AddFamilyRelationship(item);
                    }

                    FamilyRelationshipInfo fri = new FamilyRelationshipInfo();
                    var emp = objEmployees.GetEmployees(nhanvienNguon);
                    if (bChong)
                    {
                        //them thong tin chong
                        fri.fullname = emp.fullname;
                        fri.employeeid = nhanvienDich;
                        fri.address = emp.placeofcurrent;
                        fri.birthday = String.Format("{0:yyyy}", emp.birthday); ;
                        fri.occupation = emp.occupation;
                        fri.placeofbirth = emp.placeofbirth;
                        fri.relationshipid = 10; //10 = chong
                    }
                    else
                    {
                        //them thong tin vo
                        fri.fullname = emp.fullname;
                        fri.employeeid = nhanvienDich;
                        fri.address = emp.placeofcurrent;
                        fri.birthday = String.Format("{0:yyyy}", emp.birthday);
                        fri.occupation = emp.occupation;
                        fri.placeofbirth = emp.placeofbirth;
                        fri.relationshipid = 11; //11 = vo
                    }

                    frController.AddFamilyRelationship(fri);

                    cbpnGiadinh.JSProperties["cpOP"] = 1;
                }
                catch
                {
                    cbpnGiadinh.JSProperties["cpOP"] = 2;
                }
            }
        }

        private void RemoveUnMap(List<FamilyRelationshipInfo> frListS, List<FamilyRelationshipInfo> frListD, bool bChong)
        {

            frListS.RemoveAll(r => r.relationshipid == 10);
            frListS.RemoveAll(r => r.relationshipid == 11);            

            for (int i = 0; i < frListD.Count; i++)
            {               
                if (bChong)
                {
                    switch (frListD[i].relationshipid)
                    {
                        case 8:
                            frListS.RemoveAll(r => r.relationshipid == 6);
                            break;
                        case 9:
                            frListS.RemoveAll(r => r.relationshipid == 1);
                            break;
                        case 27:
                            frListS.RemoveAll(r => r.relationshipid == 23);
                            break;
                        case 28:
                            frListS.RemoveAll(r => r.relationshipid == 24);
                            break;
                        case 29:
                            frListS.RemoveAll(r => r.relationshipid == 25);
                            break;
                        case 30:
                            frListS.RemoveAll(r => r.relationshipid == 26);
                            break;
                        
                    }   
                }
                else
                {
                    switch (frListD[i].relationshipid)
                    {
                        case 12:
                            frListS.RemoveAll(r => r.relationshipid == 1);
                            break;
                        case 13:
                            frListS.RemoveAll(r => r.relationshipid == 6);
                            break;
                        case 31:
                            frListS.RemoveAll(r => r.relationshipid == 23);
                            break;
                        case 33:
                            frListS.RemoveAll(r => r.relationshipid == 24);
                            break;
                        case 34:
                            frListS.RemoveAll(r => r.relationshipid == 25);
                            break;
                        case 35:
                            frListS.RemoveAll(r => r.relationshipid == 26);
                            break;
                            break;
                    }
                }
            }
        }

        private string getConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        }

        //hard-code -> must be changed
        private int MapRelationshipId(int id, bool bBenChong)
        {
            Hashtable mapChongRId = new Hashtable();
            mapChongRId.Add(1, 9);
            mapChongRId.Add(3, 19);
            mapChongRId.Add(4, 22);
            mapChongRId.Add(5, 20);
            mapChongRId.Add(6, 8);
            mapChongRId.Add(7, 21);
            mapChongRId.Add(12, 1);
            mapChongRId.Add(13, 6);
            mapChongRId.Add(15, 3);
            mapChongRId.Add(16, 4);
            mapChongRId.Add(17, 5);
            mapChongRId.Add(18, 7);
            mapChongRId.Add(23, 27);
            mapChongRId.Add(24, 28);
            mapChongRId.Add(25, 29);
            mapChongRId.Add(26, 30);
            mapChongRId.Add(31, 23);
            mapChongRId.Add(33, 24);
            mapChongRId.Add(34, 25);
            mapChongRId.Add(35, 26);

            Hashtable mapVoRId = new Hashtable();
            mapVoRId.Add(1, 12);
            mapVoRId.Add(3, 15);
            mapVoRId.Add(4, 16);
            mapVoRId.Add(5, 17);
            mapVoRId.Add(6, 13);
            mapVoRId.Add(7, 18);
            mapVoRId.Add(8, 6);
            mapVoRId.Add(9, 1);
            mapVoRId.Add(19, 3);
            mapVoRId.Add(20, 5);
            mapVoRId.Add(21, 7);
            mapVoRId.Add(22, 4);
            mapVoRId.Add(23, 31);
            mapVoRId.Add(24, 33);
            mapVoRId.Add(25, 34);
            mapVoRId.Add(26, 35);
            mapVoRId.Add(27, 23);
            mapVoRId.Add(28, 24);
            mapVoRId.Add(29, 25);
            mapVoRId.Add(30, 26);


            if (bBenChong)
            {
                if (id == 11) return 0;
                if (mapChongRId.ContainsKey(id))
                    return (int)mapChongRId[id];
            }
            else
            {
                if (id == 10) return 0;
                if (mapVoRId.ContainsKey(id))
                    return (int)mapVoRId[id];
            }
            if (id == 2)
                return id;
            return 0;
        }
        
}
}
