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
using System.Collections;
using System.Collections.Generic;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using System.IO;
namespace Philip.Modules.TinTuc
{

    partial class QTHinhAnh : PortalModuleBase
    {


        #region Event Handlers
       
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {             
               

                //If this is the first visit to the page, bind the role data to the datalist
                if (Page.IsPostBack == false)
                {
                   
                    TinTucInfo objInfo = new TinTucInfo();
                    TinTucController objControl = new TinTucController();
                 
                    objInfo.idnhom = 5;//gallery
                    gridTintuc.EditItemIndex = -1;
                    gridTintuc.DataSource = objControl.GetTinTucs(objInfo);
                    gridTintuc.DataBind();
                    divEdit.Visible = false;
                    divPreview.Visible = true;
                    lblIdTintuc.Text = "";
                    lblError.Text = "";
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
            lblIdTintuc.Text = "";
            txtTieude.Text = "";
           // txtNoidung.Text = " ";
       
            lblError.Text = "";
            lblIdAnh.Text = "";
          
           
            divPreview.Visible = false;
            divEdit.Visible = true;


        }
        protected void dgrNhom_ItemCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
        {
            try
            {
                
                
                string sCommandName = e.CommandName;
                TinTucInfo objInfo = new TinTucInfo();
                TinTucController objControl = new TinTucController();

                int id = 0;
                if (sCommandName == "Edit")
                {
                    id = int.Parse(e.CommandArgument.ToString());
                    lblIdTintuc.Text = id.ToString();
                    divEdit.Visible = true;
                    divPreview.Visible = false;
                    ShowDetail(id);

                }
                if (sCommandName == "Delete")
                {
                    try
                    {
                        id = int.Parse(e.CommandArgument.ToString());
                        objInfo.idtintuc = id;
                        objInfo = objControl.GetTinTuc(objInfo);
                        string img = objInfo.anh;

                        objControl.DeleteTinTuc(objInfo);
                        if (img != "")
                        {
                            System.IO.FileInfo file;
                            string fileName = "";
                            string path = Server.MapPath("images/TinTuc/");
                            file = new System.IO.FileInfo(path + img);
                            if (file.Exists)
                                file.Delete();
                        }

                        //CapnhatRss(objInfo.idnhom);

                        divEdit.Visible = false;
                        divPreview.Visible = true;

                        gridTintuc.EditItemIndex = -1;
                        objInfo.idnhom = 5;//video
                        gridTintuc.DataSource = objControl.GetTinTucs(objInfo);
                        gridTintuc.DataBind();

                        lblIdTintuc.Text = "";
                        lblError.Text = "";
                        lblIdAnh.Text = "";

                    }
                    catch (Exception ex)
                    {
                        lblError.Text = ex.Message;
                        return;
                    }

                    objInfo.idnhom = 5;//video
                    gridTintuc.EditItemIndex = -1;
                    gridTintuc.DataSource = objControl.GetTinTucs(objInfo);
                    gridTintuc.DataBind();
                    divEdit.Visible = false;
                    divPreview.Visible = true;
                    lblIdTintuc.Text = "";
                    lblError.Text = "";
                }

                lblError.Text = "";
            }
            catch (Exception ex)
            { lblError.Text = "Có lỗi xảy ra!" + ex.Message; }
        }
        private void ShowDetail(int idTintuc)
        {
            TinTucInfo objInfo = new TinTucInfo();
            TinTucController objControl = new TinTucController();

            objInfo.idtintuc = idTintuc;
            objInfo = objControl.GetTinTuc(objInfo);
            txtTieude.Text = objInfo.tieude;
       
            
        
        
          
            lblIdAnh.Text = objInfo.anh;
            Image1.ImageUrl = "~/images/TinTuc/" + objInfo.anh.TrimEnd();
            
        }
        protected void btn_luu_Click(object sender, EventArgs e)
        {
            TinTucInfo objInfo = new TinTucInfo();
            TinTucController objControl = new TinTucController();
            try
            {
                //if (txtTieude.Text.Trim() == "")
                //{
                //    lblError.Text = "Bạn chưa nhập tiêu đề!";
                //    txtTieude.Focus();
                //    return;
                //}
             
               
               
                System.IO.FileInfo file;
                string fileName = "";
                string path = Server.MapPath("images/TinTuc/");
              
                if (lblIdTintuc.Text == "")//add
                {
                    if (fileAnhUpload.HasFile)
                    {
                        try
                        {
                            fileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + fileAnhUpload.FileName.TrimEnd();
                            fileAnhUpload.SaveAs(path + fileName);
                            lblIdAnh.Text = fileName;                           
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = "Up ảnh bị lỗi." + ex.Message;
                            fileAnhUpload.Focus();
                            return;
                        }
                    }
                    objInfo.anh = lblIdAnh.Text;
                    objInfo.idnhom = 5;
                  
                    objInfo.tieude = txtTieude.Text;
                  
                    objControl.AddTinTuc(objInfo);
                }
                else//update
                {
                    if (fileAnhUpload.HasFile)
                    {
                        try
                        {
                            fileName = DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + fileAnhUpload.FileName.TrimEnd();
                            fileAnhUpload.SaveAs(path + fileName);
                            if (lblIdAnh.Text != "")
                            {
                                file = new System.IO.FileInfo(path + lblIdAnh.Text);
                                if (file.Exists)
                                    file.Delete();
                            }
                            lblIdAnh.Text = fileName;
                            
                        }
                        catch (Exception ex)
                        {
                            lblError.Text = "Up ảnh bị lỗi," + ex.Message;
                            fileAnhUpload.Focus();
                            return;
                        }
                    }


                    objInfo.idtintuc = int.Parse(lblIdTintuc.Text);
                    objInfo = objControl.GetTinTuc(objInfo);
                    objInfo.idnhom = 5;
                  
                    objInfo.anh = lblIdAnh.Text;
                    objInfo.tieude = txtTieude.Text;
                 
                    objControl.UpdateTinTuc(objInfo);
                }
                divEdit.Visible = false;
                divPreview.Visible = true;

                gridTintuc.EditItemIndex = -1;
                objInfo.idnhom = 5;               
                gridTintuc.DataSource = objControl.GetTinTucs(objInfo);
                gridTintuc.DataBind();

                lblIdTintuc.Text = "";
                lblError.Text = "";
                lblIdAnh.Text = "";
               
            }
            catch (Exception ex)
            { lblError.Text = "Có lỗi xảy ra!" + ex.Message; }


         
        }
     
        protected void btn_boqua_Click(object sender, EventArgs e)
        {
            lblIdTintuc.Text = "";
            txtTieude.Text = "";
         
       
            lblError.Text = "";
            lblIdAnh.Text = "";
          
        
            divPreview.Visible = true;
            divEdit.Visible = false;

            TinTucInfo objInfo = new TinTucInfo();
            TinTucController objControl = new TinTucController();
           
            objInfo.idnhom =5;
            gridTintuc.EditItemIndex = -1;
            gridTintuc.DataSource = objControl.GetTinTucs(objInfo);
            gridTintuc.DataBind();
        }
      
        protected void gridTintuc_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {
            gridTintuc.CurrentPageIndex = e.NewPageIndex;
            gridTintuc.SelectedIndex = -1;
            TinTucInfo objInfo = new TinTucInfo();
            TinTucController objControl = new TinTucController();
            objInfo.idnhom = 5;
           
            gridTintuc.EditItemIndex = -1;
            gridTintuc.DataSource = objControl.GetTinTucs(objInfo);
            gridTintuc.DataBind();
        }
}
}

