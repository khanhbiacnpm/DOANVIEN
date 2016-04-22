/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

using System;

using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;

namespace Philip.Modules.Text
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The EditText class is used to manage content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class QuanTriText : PortalModuleBase
    {

        

        #region Event Handlers

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
               
                //If this is the first visit to the page, bind the role data to the datalist
                if (Page.IsPostBack == false)
                {
                    divEdit.Visible = false;
                    divPreview.Visible = true;
                    TextController objControl = new TextController();
                    TextInfo objInfo = new TextInfo();
                    gridText.DataSource = objControl.GetTexts(objInfo);
                    gridText.DataBind();
                    
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }
        
        #endregion

        protected void btnThemMoi_Click(object sender, EventArgs e)
        {
            divPreview.Visible = false;
            divEdit.Visible = true;
            lblError.Text = "";
            lblId.Text = "";
            txtNoidung.Text = " ";
            txtTieude.Text = "";
            //txtTomTat.Text = " ";
            txtMa.Text = "";

        }
         protected void btn_luu_Click(object sender, EventArgs e)
         {
             if (txtMa.Text.Trim() == "")
             {
                 lblError.Text="Bạn chưa nhập Mã!";
                 txtMa.Focus();
                 return;
             }
             TextController objControl = new TextController();
             TextInfo objInfo = new TextInfo();
             objInfo.chi_tiet = Server.HtmlDecode(txtNoidung.Text);
             objInfo.ma = txtMa.Text.Trim();
             objInfo.tieu_de = txtTieude.Text;
             //objInfo.tom_tat = Server.HtmlDecode(txtTomTat.Text);
                 
             if (lblId.Text == "")
             {
                  objControl.AddText(objInfo);
             }
             else
             {
                 objInfo.id_text = int.Parse(lblId.Text);
                 objControl.UpdateText(objInfo);
             }
             divEdit.Visible = false;
             divPreview.Visible = true;
            
             gridText.DataSource = objControl.GetTexts(objInfo);
             gridText.DataBind();
   

         }
         protected void btn_boqua_Click(object sender, EventArgs e)
         {
             divEdit.Visible = false;
             divPreview.Visible = true;
             lblId.Text = "";
             //TextController objControl = new TextController();
             //TextInfo objInfo = new TextInfo();
             //gridText.DataSource = objControl.GetTexts();
             //gridText.DataBind();
   
         }
         private void ShowDetail(int id)
         {
             TextController objControl = new TextController();
             TextInfo objInfo = new TextInfo();

             objInfo.id_text = id;
             objInfo = objControl.GetText(objInfo);
             txtTieude.Text = objInfo.tieu_de;
            // txtTomTat.Text = objInfo.tom_tat;
             txtNoidung.Text = objInfo.chi_tiet;
             txtMa.Text = objInfo.ma;
         }
         protected void gridText_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
         {
             try
             {


                 string sCommandName = e.CommandName;
                 TextController objControl = new TextController();
                 TextInfo objInfo = new TextInfo();

                 int id = 0;
                 if (sCommandName == "Edit")
                 {
                     id = int.Parse(e.CommandArgument.ToString());
                     lblId.Text = id.ToString();
                     divEdit.Visible = true;
                     divPreview.Visible = false;
                     ShowDetail(id);

                 }
                 if (sCommandName == "Delete")
                 {
                     try
                     {
                         id = int.Parse(e.CommandArgument.ToString());
                         objInfo.id_text = id;
                         objInfo = objControl.GetText(objInfo);
                         

                         objControl.DeleteText(objInfo);
                        
                     }
                     catch (Exception ex)
                     {
                         lblError.Text = ex.Message;
                         return;
                     }

                     
                     gridText.EditItemIndex = -1;
                     gridText.DataSource = objControl.GetTexts(objInfo);
                     gridText.DataBind();
                     lblId.Text = "";
                    
                 }

                 lblError.Text = "";
             }
             catch (Exception ex)
             { lblError.Text = "Có lỗi xảy ra!" + ex.Message; }
         }
}
}

