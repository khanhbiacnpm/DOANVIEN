<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChuyenThongTin.ascx.cs"
    Inherits="DotNetNuke.Modules.ChuyenThongTin.ChuyenThongTin" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxRoundPanel" TagPrefix="dx" %>

<script type="text/javascript">
    function AddSelectedItems() {
        MoveSelectedItems(lbRelativeSource, lbRelativeDest);
        UpdateButtonState();
    }
    function AddAllItems() {
        MoveAllItems(lbRelativeSource, lbRelativeDest);
        UpdateButtonState();
    }
    function RemoveSelectedItems() {
        RemoveSelectedItems2(lbRelativeSource, lbRelativeDest);
        UpdateButtonState();
    }
    function RemoveAllItems() {
        RemoveAllItems2(lbRelativeSource, lbRelativeDest);
        UpdateButtonState();
    }
    
    function Save()
    {
        var count = lbRelativeDest.GetItemCount();
        var destItems = "";
        for(var i = 0; i < count; i++) {
            var item = lbRelativeDest.GetItem(i);
            destItems += "," + item.value;
        }
        
        cbpnGiadinh.PerformCallback("Save:"+destItems);
    }
    
    function MoveSelectedItems(srcListBox, dstListBox) {
        var sourceItems = srcListBox.GetSelectedValues().toString();
        var count = dstListBox.GetItemCount();
        var destItems = "";
        for(var i = 0; i < count; i++) {
            var item = dstListBox.GetItem(i);
            destItems += "," + item.value;
        }
        
        cbpnGiadinh.PerformCallback("TransferSelectedItem:"+sourceItems+":"+destItems);
    }
    function MoveAllItems(srcListBox, dstListBox) {
        var count = srcListBox.GetItemCount();
        var sourceItems = "";
        for(var i = 0; i < count; i++) {
            var item = srcListBox.GetItem(i);
            sourceItems += "," + item.value;
        }
        
        count = dstListBox.GetItemCount();
        var destItems = "";
        for(var i = 0; i < count; i++) {
            var item = dstListBox.GetItem(i);
            destItems += "," + item.value;
        }
        
        cbpnGiadinh.PerformCallback("TransferSelectedItem:"+sourceItems+":"+destItems);
        
    }
    function RemoveSelectedItems2(srcListBox, dstListBox) {
        var count = srcListBox.GetItemCount();
        var sourceItems = "";
        for(var i = 0; i < count; i++) {
            var item = srcListBox.GetItem(i);
            sourceItems += item.value + ",";
        }
        
        var destItems = dstListBox.GetSelectedValues().toString();    
        
        count = dstListBox.GetItemCount();
        var destAllItems = "";
        for(var i = 0; i < count; i++) {
            var item = dstListBox.GetItem(i);
            destAllItems += "," + item.value;
        }
           
        cbpnGiadinh.PerformCallback("RemoveSelectedItem:"+sourceItems+":"+destItems+":"+destAllItems);
    }
    function RemoveAllItems2(srcListBox, dstListBox) {
        var count = srcListBox.GetItemCount();
        var sourceItems = "";
        for(var i = 0; i < count; i++) {
            var item = srcListBox.GetItem(i);
            sourceItems += "," + item.value;
        }
        
        count = dstListBox.GetItemCount();
        var destItems = "";
        for(var i = 0; i < count; i++) {
            var item = dstListBox.GetItem(i);
            destItems += "," + item.value;
        }
        
        cbpnGiadinh.PerformCallback("RemoveSelectedItem:"+sourceItems+":"+destItems+":"+destItems);
        
    }
    function UpdateButtonState() {
        btnMoveAllItemsToRight.SetEnabled(lbRelativeSource.GetItemCount() > 0);
        btnMoveAllItemsToLeft.SetEnabled(lbRelativeDest.GetItemCount() > 0);
        btnMoveSelectedItemsToRight.SetEnabled(lbRelativeSource.GetSelectedItems().length > 0);
        btnMoveSelectedItemsToLeft.SetEnabled(lbRelativeDest.GetSelectedItems().length > 0);
    }
    
</script>
    
<dx:ASPxRoundPanel Width="1000px" ID="RoundPanelNV" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
    CssPostfix="Aqua" GroupBoxCaptionOffsetY="-28px" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css"
    HeaderText="CHUYỂN TỰ ĐỘNG THÔNG TIN THÂN NHÂN CỦA VỢ-CHỒNG CÙNG ĐƠN VỊ">
    <ContentPaddings Padding="14px" />
    <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
    <PanelCollection>
        <dx:PanelContent runat="server">
            
        
<dx:ASPxCallbackPanel ID="cbpnGiadinh" runat="server" ClientInstanceName="cbpnGiadinh" 
        ShowLoadingPanel="true" 
        LoadingPanelStyle-VerticalAlign="Top"
        LoadingPanelStyle-HorizontalAlign="Center"
        OnCallback="cbpnGiadinh_Callback">
     <ClientSideEvents EndCallback='function(s,e)
     {
        if (cbpnGiadinh.cpOP == 1)
        {
            alert("Chuyển thông tin kết thúc");
        }
        else if (cbpnGiadinh.cpOP == 2)
        {
            alert("Có lỗi khi chuyển thông tin");
        }
        delete cbpnGiadinh.cpOP;
        
     }' />

<LoadingPanelStyle HorizontalAlign="Center" VerticalAlign="Top"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
            
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td style="width:50%;">
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="font-size:11pt; font-family:Tahoma;">
                            <tr>
                                <td colspan="2" align="left">
                                Nhân viên nguồn
                                </td>
                            </tr>
                            
                            <tr style="padding-top: 10px; padding-left: 10px;">
                                <td>
                                    <dx:ASPxComboBox Width="100%" ID="cbbSource" runat="server" ClientInstanceName="cbbSource"
                                        EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains" DropDownWidth="600px"
                                        DropDownStyle="DropDownList" ValueField="id" TextFormatString="{0} - {1}" AutoPostBack="false"
                                        EnableCallbackMode="true" CallbackPageSize="30" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ClientSideEvents SelectedIndexChanged='function(s,e)
                                        {
                                            cbpnGiadinh.PerformCallback("LR");
                                        }' 
                                        />
                                        
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Mã NV" FieldName="empcode" Width="100px" />
                                            <dx:ListBoxColumn Caption="Họ tên" FieldName="fullname" Width="200px" />
                                            <dx:ListBoxColumn Caption="Đơn vị" FieldName="name" Width="200px" />
                                        </Columns>
                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                            </Image>
                                        </DropDownButton>
                                        <ValidationSettings ValidationGroup="editForm">
                                            <RequiredField IsRequired="true" ErrorText="Chọn nhân viên nguồn" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                   
                    </td>
                    
                    <td  style="width:50%;">
                    
                        <table border="0" cellpadding="0" cellspacing="0" width="100%" style="font-size:11pt; font-family:Tahoma;">
                            <tr>
                                <td colspan="2">Nhân viên đích
                                </td>
                            </tr>
                            
                            <tr style="padding-top: 10px; padding-left: 10px;">
                                <td>
                                    <dx:ASPxComboBox Width="100%" ID="cbbDest" runat="server" ClientInstanceName="cbbDest"
                                        EnableIncrementalFiltering="true" IncrementalFilteringMode="Contains" DropDownWidth="600px"
                                        DropDownStyle="DropDownList" ValueField="id" TextFormatString="{0} - {1}" AutoPostBack="false"
                                        EnableCallbackMode="true" CallbackPageSize="30" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                        CssPostfix="Aqua" LoadingPanelImagePosition="Top" ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ClientSideEvents SelectedIndexChanged='function(s,e)
                                        {
                                            cbpnGiadinh.PerformCallback("LR");
                                        }' 
                                        />
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Mã NV" FieldName="empcode" Width="100px" />
                                            <dx:ListBoxColumn Caption="Họ tên" FieldName="fullname" Width="200px" />
                                            <dx:ListBoxColumn Caption="Đơn vị" FieldName="name" Width="200px" />
                                        </Columns>
                                        <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                                        </LoadingPanelImage>
                                        <DropDownButton>
                                            <Image>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                            </Image>
                                        </DropDownButton>
                                        <ValidationSettings ValidationGroup="editForm">
                                            <RequiredField IsRequired="true" ErrorText="Chọn nhân viên đích" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>                        
                    </td>                    
                </tr>
            </table>
            <div style="height: 20px;"></div>
            <table border="0" cellpadding="0" cellspacing="0" width="100%" style="font-size:11pt; font-family:Tahoma;">
                <tr>
                    <td>
                    Thông tin thân nhân nguồn
                    </td>
                    <td></td>
                    <td>
                    Thông tin thân nhân đích
                    </td>
                </tr>
                <tr>
                    <td style="padding-top: 10px;">
                        <dx:ASPxListBox SelectionMode="CheckColumn" Width="100%" Height="400px" ValueField="id" ID="lbRelativeSource" ClientInstanceName="lbRelativeSource" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            LoadingPanelImagePosition="Top" 
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <ClientSideEvents 
                                SelectedIndexChanged="function(s, e) 
                                { 
                                    UpdateButtonState();
                                }
                            ">
                            </ClientSideEvents>
                            <Columns>
                                <dx:ListBoxColumn FieldName="fullname" Caption="Họ tên" />
                                <dx:ListBoxColumn FieldName="description" Caption="Quan hệ" />
                            </Columns>
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxListBox>                    
                    </td>
                    <td valign="top" align="center" style="padding: 10px; width: 30%">
                        <div>
                        <table border="0" cellpadding="0" cellspacing="0">
                            <tr>    
                                <th colspan="2" align="center">
                                    Mối quan hệ
                                </th>
                            </tr>
                            <tr style="height:5px;">
                                <td colspan="2"></td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxRadioButton GroupName="quanhe" ID="rbChong" runat="server" Text="Chồng" 
                                        Checked="true" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" TextSpacing="2px" ></dx:ASPxRadioButton>
                                </td>
                                <td>
                                    <dx:ASPxRadioButton GroupName="quanhe" ID="rbVo" runat="server" Text="Vợ" 
                                        TextAlign="Right" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                        CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                                        TextSpacing="2px"></dx:ASPxRadioButton>
                                </td>
                            </tr>
                        
                        </table>
                        </div>
                        <div style="height: 30px;">
                        </div>
                        <div>
                            <dx:ASPxButton runat="server" ClientInstanceName="btnMoveSelectedItemsToRight"
                                AutoPostBack="False" Text="Thêm >" Width="130px" Height="23px" ClientEnabled="False"
                                ToolTip="Thêm nhân viên lựa chọn" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ClientSideEvents 
                                    Click='function(s, e) 
                                    { 
                                        AddSelectedItems(); 
                                    }' 
                                />
                            </dx:ASPxButton>
                        </div>
                        <div>
                            <dx:ASPxButton runat="server" ClientInstanceName="btnMoveAllItemsToRight"
                                AutoPostBack="False" Text="Thêm tất cả >>" Width="130px" Height="23px" 
                                ToolTip="Add all items" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ClientSideEvents 
                                    Click='function(s, e) { 
                                        AddAllItems(); 
                                    }' 
                                />
                            </dx:ASPxButton>
                        </div>
                        <div style="height: 32px">
                        </div>
                        <div>
                            <dx:ASPxButton runat="server" ClientInstanceName="btnMoveSelectedItemsToLeft"
                                AutoPostBack="False" Text="< Xóa" Width="130px" Height="23px" ClientEnabled="False"
                                ToolTip="Xóa nhân viên lựa chọn" 
                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ClientSideEvents 
                                    Click='function(s, e) { 
                                        RemoveSelectedItems(); 
                                    }' 
                                />
                            </dx:ASPxButton>
                        </div>
                        <div>
                            <dx:ASPxButton runat="server" ClientInstanceName="btnMoveAllItemsToLeft"
                                AutoPostBack="False" Text="<< Xóa hết" Width="130px" Height="23px" ClientEnabled="False"
                                ToolTip="Xóa hết" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                <ClientSideEvents Click='function(s, e) { 
                                    RemoveAllItems(); 
                                }' />
                            </dx:ASPxButton>
                        </div>
                        <div style="height: 32px">
                        </div>
                        <div>
                            <dx:ASPxButton ID="ASPxButton1" AutoPostBack="false" Text="Lưu lại" Width="130px" runat="server" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                        <ClientSideEvents Click='function(s,e){
                                            if (ASPxClientEdit.ValidateGroup("editForm"))
                                            {
                                                Save();
                                            }
                                        }' />
                                    
                                    </dx:ASPxButton>
                        </div>
                    </td>
                    <td style="padding-top: 10px;">
                        <dx:ASPxListBox SelectionMode="CheckColumn" Width="100%" Height="400px" ValueField="id" ID="lbRelativeDest" ClientInstanceName="lbRelativeDest" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            LoadingPanelImagePosition="Top" 
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <ClientSideEvents 
                                SelectedIndexChanged="function(s, e) 
                                { 
                                    UpdateButtonState();
                                }
                            ">
                            </ClientSideEvents>
                            <Columns>
                                <dx:ListBoxColumn FieldName="fullname" Caption="Họ tên" />
                                <dx:ListBoxColumn FieldName="description" Caption="Quan hệ" />
                            </Columns>
                            <LoadingPanelImage Url="~/App_Themes/Aqua/Editors/Loading.gif">
                            </LoadingPanelImage>
                            <ValidationSettings>
                                <ErrorFrameStyle ImageSpacing="4px">
                                    <ErrorTextPaddings PaddingLeft="4px" />
                                </ErrorFrameStyle>
                            </ValidationSettings>
                        </dx:ASPxListBox>
                    </td>
                </tr>
            </table>
            
        </dx:PanelContent>
    </PanelCollection>    
 </dx:ASPxCallbackPanel>
             
        </dx:PanelContent>    
    </PanelCollection>
</dx:ASPxRoundPanel>