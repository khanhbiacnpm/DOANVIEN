<%@ Control Language="C#" Inherits="VNPT.Modules.Unit.ViewUnit" CodeFile="ViewUnit.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxMenu" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxSplitter" TagPrefix="dx" %>
<script type="text/javascript">
    var currentNodeKey;
    function ShowMenu(nodeKey, x, y) {
        clientPopupMenu.ShowAtPos(x, y);
        currentNodeKey = nodeKey;
    }
    function show_context_menu(s, e) {
        if (e.objectType != 'Node') return;
        s.SetFocusedNodeKey(e.objectKey);
        var key = e.objectKey;
        var mouseX = ASPxClientUtils.GetEventX(e.htmlEvent);
        var mouseY = ASPxClientUtils.GetEventY(e.htmlEvent);
        ShowMenu(e.objectKey, mouseX, mouseY);
    }
    function ProcessNodeClick(itemName) {
        switch (itemName) {
            case "new":
                {
                    hienthi_popupControl(0, currentNodeKey);
                    break;
                }
            case "edt":
                {
                    hienthi_popupControl(1, currentNodeKey);
                    break;
                }
            case "del":
                {
                    if (confirm('Bạn có muốn xóa thông tin này không?')) {
                        treelist_donvi.GetNodeValues(currentNodeKey, "id_cha", function (value) {
                            callback_luuthongtin.PerformCallback('xoa;' + currentNodeKey);
                            hdf_key.Set('id_cha', value);
                        });
                        break;
                    }
                }
            default: return;
        }
    }
    function hienthi_popupControl(trangthai, iddonvi) {
        var yPos = (($(window).height()) / 2) - 270;
        var xPos = (($(window).width()) / 2) - 270;
        popupControl.ShowAtPos(xPos, yPos);
        clientPopupMenu.Hide();
        if (trangthai == 0) {
            popupControl.SetHeaderText('Thêm mới thông tin đơn vị');
            var item_dv = ddlParentUnit.FindItemByValue(iddonvi);
            if (item_dv != null)
                ddlParentUnit.SetSelectedItem(item_dv);
            else
                ddlParentUnit.SetSelectedIndex(0);
            txtName.SetText('');
            txtCode.SetText('');
            txtEstablishdesicion.SetText('');
            establishdate.SetDate(new Date());
            txtFunctiondesicion.SetText('');
            functiondate.SetEnabled(false);
            txtCanceldesicion.SetText('');
            txtCanceldesicion.SetEnabled(false);
            txtAddress.SetText('');
            txtPhone.SetText('');
            txtTaxCode.SetText('');
            txtThuTu.SetText('');
            txtDinhBien.SetText('');
            cmbLoaiDonVi.SetSelectedIndex(0);

            hdf_key.Set('iddonvi', iddonvi);
            hdf_key.Set('trangthai', trangthai);
        }
        else if (trangthai == 1) {
            popupControl.SetHeaderText('Cập nhật thông tin đơn vị');
            var key = treelist_donvi.GetFocusedNodeKey();
            treelist_donvi.GetNodeValues(key, "ten_donvi;ngay_lap;so_qd_lap;dia_chi;dien_thoai;dinh_bien;viet_tat;chuc_nang;so_thue;thu_tu;loai_dv;id_cha", function (values) {

                txtName.SetText(values[0]);
                establishdate.SetDate(values[1]);
                txtEstablishdesicion.SetText(values[2]);
                txtAddress.SetText(values[3]);
                txtPhone.SetText(values[4]);
                txtDinhBien.SetText(values[5]);
                txtCode.SetText(values[6]);
                txtFunctiondesicion.SetText(values[7]);
                txtTaxCode.SetText(values[8]);
                txtThuTu.SetText(values[9]);

                var item_ldv = cmbLoaiDonVi.FindItemByValue(values[10]);
                if (item_ldv != null)
                    cmbLoaiDonVi.SetSelectedItem(item_ldv);
                else
                    cmbLoaiDonVi.SetSelectedIndex(0);

                var item_dv = ddlParentUnit.FindItemByValue(values[11]);
                if (item_dv != null)
                    ddlParentUnit.SetSelectedItem(item_dv);
                else
                    ddlParentUnit.SetSelectedIndex(0);

                functiondate.SetEnabled(true);
                txtCanceldesicion.SetEnabled(true);

                hdf_key.Set('id_cha', values[11]);
                hdf_key.Set('iddonvi', key);
                hdf_key.Set('trangthai', trangthai);
            });
        }
    }
    function luu_thongtin() {
        if (txtName.GetText() == '') {
            alert('Vui lòng nhập tên đơn vị');
            txtName.Focus();
            return false;
        } else if (txtEstablishdesicion.GetText() == '') {
            alert('Vui lòng nhập Số QĐ thành lập');
            txtEstablishdesicion.Focus();
            return false;
        } else if (establishdate.GetDate() == null || establishdate.GetDate() == '') {
            alert('Vui lòng chọn ngày thành lập');
            establishdate.Focus();
            return false;
        } else if (txtFunctiondesicion.GetText() == '') {
            alert('Vui lòng nhập chức năng đơn vị');
            txtFunctiondesicion.Focus();
            return false;
        } else if (isNaN(txtThuTu.GetText())) {
            alert('Vui lòng nhập kiểu số.');
            txtThuTu.Focus();
            return false;
        } else if (isNaN(txtDinhBien.GetText())) {
            alert('Vui lòng nhập kiểu số');
            txtDinhBien.Focus();
            return false;
        } else {
            GetData();
            var trangthai = hdf_key.Get('trangthai');
            if (parseInt(trangthai) == 0)
                trangthai = 'them;0';
            else
                trangthai = 'sua;1';
            callback_luuthongtin.PerformCallback(trangthai);
        }
    }
    function GetData() {
        popupControl.Hide();
        var iddonvi = ddlParentUnit.GetValue();
        hdf_key.Set('id_cha', iddonvi);
        hdf_key.Set('tendonvi', txtName.GetText());
        hdf_key.Set('viettat', txtCode.GetText());
        hdf_key.Set('qdthanhlap', txtEstablishdesicion.GetText());
        hdf_key.Set('ngaythanhlap', establishdate.GetDate());
        hdf_key.Set('chucnang', txtFunctiondesicion.GetText());
        hdf_key.Set('ngayhuy', functiondate.GetDate());
        hdf_key.Set('qdhuy', txtCanceldesicion.GetText());
        hdf_key.Set('diachi', txtAddress.GetText());
        hdf_key.Set('dienthoai', txtPhone.GetText());
        hdf_key.Set('sothue', txtTaxCode.GetText());
        hdf_key.Set('thutu', txtThuTu.GetText());
        hdf_key.Set('dinhbien', txtDinhBien.GetText());
        var loai_donvi = cmbLoaiDonVi.GetValue();
        hdf_key.Set('loaidv', loai_donvi);
    }
    function dong_popupControl(s, e) {
        popupControl.Hide();
    }
    function end_callback(s, e) {
        if (callback_luuthongtin.cpOp == 0) {
            alert('Lưu thông tin thành công.');
            delete callback_luuthongtin.cpOp;
            var node_key = hdf_key.Get('id_cha');
            hdf_key.Remove('id_cha');
            hdf_key.Remove('iddonvi');
            hdf_key.Remove('trangthai');
            popupControl.Hide();
            ddlParentUnit.PerformCallback();
            treelist_donvi.PerformCallback(node_key);
        } else if (callback_luuthongtin.cpOp == 1) {
            alert('Cập nhật thông tin thành công.');
            delete callback_luuthongtin.cpOp;
            var node_key = hdf_key.Get('id_cha');
            hdf_key.Remove('id_cha');
            hdf_key.Remove('iddonvi');
            hdf_key.Remove('trangthai');
            popupControl.Hide();
            ddlParentUnit.PerformCallback();
            treelist_donvi.PerformCallback(node_key);
        }else if (callback_luuthongtin.cpOp == 2) {
            alert('Xóa thông tin thành công.');
            delete callback_luuthongtin.cpOp;
            var node_key = hdf_key.Get('id_cha');
            hdf_key.Remove('id_cha');
            hdf_key.Remove('iddonvi');
            hdf_key.Remove('trangthai');
            popupControl.Hide();
            ddlParentUnit.PerformCallback();
            treelist_donvi.PerformCallback(node_key);
        }
    }
</script>
<dx:ASPxTreeList ID="treelist_donvi" runat="server" Width="100%" ClientInstanceName="treelist_donvi"
    KeyFieldName="id" OnVirtualModeCreateChildren="treeList_VirtualModeCreateChildren"
    OnVirtualModeNodeCreating="treeList_VirtualModeNodeCreating" OnCustomCallback="treelist_donvi_OnCustomCallback"
    AutoGenerateColumns="False" Theme="Glass" Font-Size="12px">
    <ClientSideEvents ContextMenu="show_context_menu" />
    <SettingsLoadingPanel ImagePosition="Top" />
    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
        <LoadingPanel Url="~/App_Themes/Aqua/TreeList/Loading.gif">
        </LoadingPanel>
    </Images>
    <SettingsBehavior AllowFocusedNode="true" />
    <Columns>
        <dx:TreeListTextColumn FieldName="ten_donvi" Caption="Tên đơn vị" />        
        <dx:TreeListTextColumn FieldName="ngay_lap" Caption="Ngày lập">
            <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy" />
        </dx:TreeListTextColumn>
        <dx:TreeListTextColumn FieldName="so_qd_lap" Caption="Số QĐ" />        
        <dx:TreeListTextColumn FieldName="dia_chi" Caption="Địa chỉ" />
        <dx:TreeListTextColumn FieldName="dien_thoai" Caption="Điện thoại" />
        <dx:TreeListTextColumn FieldName="dinh_bien" Caption="Định biên" />        
        <dx:TreeListTextColumn FieldName="viet_tat" Visible="false" />
        <dx:TreeListTextColumn FieldName="chuc_nang" Visible="false" />
        <dx:TreeListTextColumn FieldName="ngay_huy" Visible="false" />
        <dx:TreeListTextColumn FieldName="so_qd_huy" Visible="false" />              
        <dx:TreeListTextColumn FieldName="so_thue" Visible="false" />
        <dx:TreeListTextColumn FieldName="thu_tu" Visible="false" />        
        <dx:TreeListTextColumn FieldName="loai_dv" Visible="false" />
        <dx:TreeListTextColumn FieldName="id_cha" Visible="false" />
    </Columns>
</dx:ASPxTreeList>
<dx:ASPxPopupMenu ID="clientPopupMenu" runat="server" ClientInstanceName="clientPopupMenu"
    GutterImageSpacing="7px" GutterWidth="16px" LoadingPanelImagePosition="Top" Theme="Glass" Font-Size="12px">
    <Items>
        <dx:MenuItem Name="new" Text="Thêm mới">
            <Image Url="../../images/imgadmin/add.png" Width="12px">
            </Image>
        </dx:MenuItem>
        <dx:MenuItem Name="edt" Text="Sửa">
            <Image Url="../../images/imgadmin/edit.png" Width="12px">
            </Image>
        </dx:MenuItem>
        <dx:MenuItem Name="del" Text="Xóa">
            <Image Url="../../images/imgadmin/stop.png" Width="12px">
            </Image>
        </dx:MenuItem>
    </Items>
    <ClientSideEvents ItemClick="function(s, e) { ProcessNodeClick(e.item.name);}" />
    <RootItemSubMenuOffset FirstItemX="2" FirstItemY="-2" LastItemX="2" LastItemY="-2"
        X="2" Y="-2" />
    <LoadingPanelImage Url="~/App_Themes/Aqua/Web/Loading.gif">
    </LoadingPanelImage>
    <ItemSubMenuOffset FirstItemX="2" FirstItemY="-2" LastItemX="2" LastItemY="-2" X="2"
        Y="-2" />
    <SubMenuStyle GutterWidth="0px" />
</dx:ASPxPopupMenu>
<dx:ASPxPopupControl ID="popupControl" runat="server" ClientInstanceName="popupControl"
    Width="350px" Height="135px" Theme="Glass" Font-Size="12px" CloseAction="CloseButton"
    Modal="true" AllowDragging="true" HeaderText="Thêm/Cập nhật thông đơn vị">
    <ContentCollection>
        <dx:PopupControlContentControl ID="content_ctr">
            <dx:ASPxHiddenField ID="hdf_key" runat="server" ClientInstanceName="hdf_key" />
            <table width="550px" cellpadding="1" cellspacing="1" style="font-family: Verdana;
                font-size: 10pt;">
                <tr>
                    <td>
                        Đơn vị cha
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="ddlParentUnit" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ClientInstanceName="ddlParentUnit"
                            IncrementalFilteringMode="Contains" DropDownStyle="DropDown"
                            OnCallback="ddlParentUnit_OnCallback">
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 160px;">
                        Tên đơn vị
                    </td>
                    <td>
                        <dx:ASPxTextBox ClientInstanceName="txtName" ID="txtName" runat="server" Width="100%"
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Viết tắt
                    </td>
                    <td>
                        <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="txtCode" ID="txtCode"
                            runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        QĐ thành lập
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtEstablishdesicion" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ClientInstanceName="txtEstablishdesicion" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày hiệu lực
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="establishdate" ClientInstanceName="establishdate" runat="server"
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" DisplayFormatString="dd/MM/yyyy"
                            EditFormatString="dd/MM/yyyy">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        QĐ chức năng nhiệm vụ
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtFunctiondesicion" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ClientInstanceName="txtFunctiondesicion" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Ngày hết hiệu lực
                    </td>
                    <td>
                        <dx:ASPxDateEdit ID="functiondate" ClientInstanceName="functiondate" runat="server"
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" DisplayFormatString="dd/MM/yyyy"
                            EditFormatString="dd/MM/yyyy">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
                <tr>
                    <td>
                        QĐ hết hiệu lực
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtCanceldesicion" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ClientInstanceName="txtCanceldesicion" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa chỉ
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtAddress" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ClientInstanceName="txtAddress" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Điện thoại
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtPhone" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ClientInstanceName="txtPhone" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Mã số thuế
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtTaxCode" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                            CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" ClientInstanceName="txtTaxCode" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Thứ tự đơn vị
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtThuTu" ClientInstanceName="txtThuTu" runat="server" Width="100%"
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Định biên lao động
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtDinhBien" ClientInstanceName="txtDinhBien" runat="server"
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Loại đơn vị
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cmbLoaiDonVi" runat="server" ClientInstanceName="cmbLoaiDonVi"
                            Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                            SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                            <Items>
                                <dx:ListEditItem Text="Kỹ thuật" Value="1" />
                                <dx:ListEditItem Text="Bán hàng" Value="2" />
                                <dx:ListEditItem Text="Bán hàng ghép kỹ thuật" Value="3" />
                                <dx:ListEditItem Text="Khác" Value="4" />
                            </Items>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div style="width: 340px; height: 25px; clear: left;">
                            <div style="width: 68px; height: 20px; float: left;">
                                <dx:ASPxButton ID="bt_luu_donvi" runat="server" Text="Lưu" AutoPostBack="false" HorizontalAlign="Left"
                                    Width="50px" Theme="Glass" Font-Size="12px">
                                    <Image Url="../../images/imgadmin/save_16.png" Height="15px">
                                    </Image>
                                    <ClientSideEvents Click="function(s,e){
                                            luu_thongtin();
                                        }" />
                                </dx:ASPxButton>
                            </div>
                            <div style="width: 68px; height: 20px; float: left;">
                                <dx:ASPxButton ID="bt_dong" runat="server" Text="Đóng" Width="50px" Font-Size="12px"
                                    HorizontalAlign="Left"  Theme="Glass">
                                    <ClientSideEvents Click="dong_popupControl" />
                                    <Image Url="../../images/imgadmin/stop.png" Height="15px">
                                    </Image>
                                </dx:ASPxButton>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
<dx:ASPxCallback ID="callback_luuthongtin" runat="server" ClientInstanceName="callback_luuthongtin"
    OnCallback="luuthongtin_OnCallback" EnableViewState="true">
    <ClientSideEvents EndCallback="end_callback" />
</dx:ASPxCallback>
<%--
<table width="100%" cellpadding="2">
    <tr>
    <td valign="top">
     <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" ClientInstanceName="CallBackTree"
                            OnCallback="CallBackTree_Callback">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent2" runat="server">
             <dx:ASPxTreeList ID="treeList" runat="server" Width="100%" KeyFieldName="Id" ClientInstanceName="treeList"
                                        AutoGenerateColumns="False" Height="400px" OnVirtualModeCreateChildren="treeList_VirtualModeCreateChildren"
                                        OnVirtualModeNodeCreating="treeList_VirtualModeNodeCreating" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                        CssPostfix="Aqua">
                                          <ClientSideEvents FocusedNodeChanged="function(s, e) { 
			            var key = treeList.GetFocusedNodeKey();
			            CallbackPanel.PerformCallback(key);			
		            }" />
                                        <SettingsCookies Enabled="True" StoreExpandedNodes="false" />
                                        <Columns>
                                            <dx:TreeListTextColumn FieldName="Name">
                                                <PropertiesTextEdit EncodeHtml="false" Size="9">
                                                </PropertiesTextEdit>
                                            </dx:TreeListTextColumn>
                                        </Columns>
                                        <SettingsBehavior ProcessFocusedNodeChangedOnServer="false" AllowFocusedNode="true"
                                            ExpandCollapseAction="NodeDblClick" />
                                        <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                                            <CustomizationWindowContent VerticalAlign="Top">
                                            </CustomizationWindowContent>
                                        </Styles>
                                        <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            <LoadingPanel Url="~/App_Themes/Aqua/TreeList/Loading.gif">
                                            </LoadingPanel>
                                        </Images>
                                        <SettingsLoadingPanel ImagePosition="Top" />
                                        <Settings ShowColumnHeaders="false" />
                                       
                                        <Templates>
                                            <DataCell>
                                                <table cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td valign="top">
                                                            <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl='<%# GetIconUrl(Container) %>'
                                                                Width="16" Height="16" IsPng="true">
                                                            </dx:ASPxImage>
                                                        </td>
                                                        <td valign="top">
                                                        </td>
                                                        <td valign="top" style="padding-bottom: 1px; text-align: left;">
                                                            <font size="2" face="Tahoma"><b>&nbsp;
                                                                <%# Container.Text %></b></font>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </DataCell>
                                        </Templates>
                                        <ImagesEditors>
                                            <DropDownEditDropDown>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                                            </DropDownEditDropDown>
                                            <SpinEditIncrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
                                            </SpinEditIncrement>
                                            <SpinEditDecrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
                                            </SpinEditDecrement>
                                            <SpinEditLargeIncrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
                                            </SpinEditLargeIncrement>
                                            <SpinEditLargeDecrement>
                                                <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                                                    PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
                                            </SpinEditLargeDecrement>
                                        </ImagesEditors>
                                    </dx:ASPxTreeList>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
    </td>
    <td valign="top">
    
                             <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="CallbackPanel"
        OnCallback="ASPxCallbackPanel1_Callback">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <dx:ASPxGridView ID="grid" runat="server" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                    CssPostfix="Aqua" ClientInstanceName="grid" 
                    KeyFieldName="id" Caption="Quản trị đơn vị"
                    OnRowUpdating="grid_RowUpdating" 
                    
                    OnRowInserting="grid_RowInserting" 
                    OnRowDeleting="grid_RowDeleting"
                    onhtmldatacellprepared="grid_HtmlDataCellPrepared">
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                    <ClientSideEvents RowDblClick="function(s, e) {
    grid.StartEditRow(e.visibleIndex);
}" EndCallback="function(s,e){
    var nNV_DVi = grid.cpIdDonVi;
    if(nNV_DVi !=0)        
        functiondate.SetEnabled(false);
    else
        functiondate.SetEnabled(true);
        
}" />
                    <Templates>
                        <EditForm>
                            <div style="padding: 4px 4px 3px 4px">
                                <table width="550px" cellpadding="1" cellspacing="1" style="font-family:Verdana; font-size:10pt;">                                    
                                    <tr>
                                        <td style="width:160px;">
                                            Đơn vị
                                        </td>
                                        <td>
                                          
                                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtName"
                                                runat="server" OnLoad="txtName_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="editForm" Display="Dynamic" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Nhập đơn vị"></RequiredField>
                                                    <ErrorFrameStyle ForeColor="Red">
                                                        <Paddings Padding="3px" PaddingLeft="4px" />
                                                        <ErrorTextPaddings PaddingRight="3px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Viết tắt
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox EnableClientSideAPI="true" ClientInstanceName="Name" ID="txtCode"
                                                runat="server" OnLoad="txtCode_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Đơn vị cha
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="ddlParentUnit" runat="server" OnLoad="ddlParentUnit_Load" Width="100%"
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td>
                                            QĐ thành lập
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtEstablishdesicion" runat="server" OnLoad="txtEstablishdesicion_Load"
                                                Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Ngày hiệu lực
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="establishdate" ClientInstanceName="establishdate" runat="server"
                                                OnLoad="establishdate_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            QĐ chức năng nhiệm vụ
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtFunctiondesicion" runat="server" OnLoad="txtFunctiondesicion_Load"
                                                Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Ngày hết hiệu lực
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="functiondate" 
                                                ClientInstanceName="functiondate" runat="server"
                                                OnLoad="functiondate_Load" Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css"
                                                CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            QĐ hủy bỏ
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtCanceldesicion" runat="server" OnLoad="txtCanceldesicion_Load"
                                                Width="100%" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua"
                                                SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Địa chỉ
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtAddress" runat="server" OnLoad="txtAddress_Load" Width="100%"
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Điện thoại
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtPhone" runat="server" OnLoad="txtPhone_Load" Width="100%"
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            Mã số thuế
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtTaxCode" runat="server" OnLoad="txtTaxCode_Load" Width="100%"
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                           Thứ tự đơn vị
                                        </td>
                                        <td> <dx:ASPxTextBox ID="txtThuTu" ClientInstanceName="txtThuTu" runat="server" OnLoad="txtThuTu_Load" Width="100%"
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                            
                                        </td>
                                    </tr>                                          
                                    <tr>
                                        <td>
                                          Định biên lao động
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="txtDinhBien" ClientInstanceName="txtDinhBien" runat="server" OnLoad="txtDinhBien_Load" Width="100%"
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" />
                                        </td>
                                    </tr> 
                                     <tr>
                                        <td>
                                            Loại đơn vị
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cmbLoaiDonVi" runat="server" OnLoad="cmbLoaiDonVi_Load" Width="100%"
                                                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>
                                            <table cellpadding="2" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){                                             
                                                        if(isNaN(txtDinhBien.GetText()))
                                                        {
                                             grid.UpdateEdit();
                                             CallBackTree.PerformCallback();}}">
                                                            <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/save_f2.png"
                                                                alt="" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="if(ASPxClientEdit.ValidateGroup('editForm')){
                                             grid.UpdateEdit();
                                             CallBackTree.PerformCallback();}"><font size="2">Chỉnh sửa</font></a>
                                                    </td>
                                                    <td style="width: 5px;">
                                                    </td>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="grid.CancelEdit()">
                                                            <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/restore_f2.png"
                                                                alt="" />
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a style="text-decoration: none;" onclick="grid.CancelEdit()"><font size="2">Đóng</font></a>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </EditForm>
                        <StatusBar>
                            <a style="text-decoration: none;" onclick="grid.AddNewRow()">
                                <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/add.png"
                                    alt="" />
                            </a><a style="text-decoration: none;" onclick="grid.AddNewRow()"><font size="2">Thêm
                                mới</font> </a>&nbsp; <a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                                    <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/edit_f2.png"
                                        alt="" />
                                </a><a style="text-decoration: none;" onclick="grid.StartEditRow(grid.GetFocusedRowIndex());">
                                    <font size="2">Chỉnh sửa</font> </a>&nbsp; <a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                        <img height="20" width="20" src="<%= DotNetNuke.Common.Globals.ApplicationPath %>/images/menu/cancel_f2.png"
                                            alt="" />
                                    </a><a style="text-decoration: none;" onclick="if ( confirm('Bạn có muốn xóa ?') ) {grid.DeleteRow(grid.GetFocusedRowIndex());}">
                                        <font size="2">Xóa</font></a>&nbsp;
                        </StatusBar>
                    </Templates>
                    <Columns>
                        <dx:GridViewDataColumn FieldName="id" VisibleIndex="0" Visible="false" />
                        <dx:GridViewDataColumn FieldName="level" VisibleIndex="1" Visible="false" />
                        <dx:GridViewDataColumn FieldName="parentid" VisibleIndex="2" Visible="false" />                        
                        <dx:GridViewDataColumn FieldName="dinhbien" VisibleIndex="2" Visible="false" />                        
                        <dx:GridViewDataColumn FieldName="loaidonvi" VisibleIndex="2" Visible="false" />                        
                        <dx:GridViewDataColumn FieldName="establishdate" Caption="Ngày thành lập" VisibleIndex="3">
                            
                            <DataItemTemplate>
                                <dx:ASPxLabel ID ="lbl_ngaythanhlap" runat="server"></dx:ASPxLabel>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="dinhbien" Caption="Định biên" VisibleIndex="4" Visible="true" />
                        <dx:GridViewDataColumn FieldName="functiondesicion" VisibleIndex="4" Visible="false" />
                        <dx:GridViewDataColumn FieldName="functiondate" VisibleIndex="3" Caption="Ngày hủy">
                            <DataItemTemplate>
                                <dx:ASPxLabel ID ="lbl_ngayhuy" runat="server"></dx:ASPxLabel>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="coefficient" VisibleIndex="3" Visible="false" />
                        <dx:GridViewDataColumn FieldName="establishdesicion" VisibleIndex="3" Visible="false" />
                        <dx:GridViewDataColumn FieldName="CapDonVi" VisibleIndex="3" Visible="false" />
                        <dx:GridViewDataColumn FieldName="canceldesicion" VisibleIndex="3" Visible="false" />
                        <dx:GridViewDataColumn FieldName="unitcode" Caption="Mã đơn vị" VisibleIndex="1" Visible="false" />
                        <dx:GridViewDataColumn FieldName="code" Caption="Viết tắt" VisibleIndex="2" Visible="false" />
                        <dx:GridViewDataColumn FieldName="name" Caption="Đơn vị" VisibleIndex="1" />
                        <dx:GridViewDataColumn FieldName="address" Caption="Địa chỉ" VisibleIndex="3" Visible="false" />
                        <dx:GridViewDataColumn FieldName="establishdesicion" Caption="QĐ thành lập" VisibleIndex="4" />
                        <dx:GridViewDataColumn FieldName="phone" Caption="Điện thoại" Visible="false" VisibleIndex="4" />
                        <dx:GridViewDataColumn FieldName="taxcode" Caption="Mã số thuế" Visible="false" VisibleIndex="5" />
                    </Columns>
                    <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                        <Header Font-Bold="True">
                        </Header>
                        <HeaderPanel Font-Bold="True">
                        </HeaderPanel>
                        <LoadingPanel ImageSpacing="8px">
                        </LoadingPanel>
                        <TitlePanel Font-Bold="True">
                        </TitlePanel>
                    </Styles>
                    <Settings ShowStatusBar="Visible" />
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="true" />
                    <SettingsText PopupEditFormCaption="Hiệu chỉnh đơn vị" ConfirmDelete="Bạn có muốn xóa" />
                    <SettingsEditing PopupEditFormHorizontalAlign="Center" PopupEditFormVerticalAlign="Above"
                        PopupEditFormModal="true" EditFormColumnCount="3" Mode="PopupEditForm" PopupEditFormWidth="550px" />
                    <SettingsLoadingPanel ImagePosition="Top" />
                    <SettingsPager PageSize="100">
                        <Summary AllPagesText="{0} - {1} " Visible="False" />
                    </SettingsPager>
                    <ImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                        </LoadingPanel>
                    </ImagesFilterControl>
                    <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <StylesEditors>
                        <CalendarHeader Spacing="1px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <ImagesEditors>
                        <DropDownEditDropDown>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                        </DropDownEditDropDown>
                        <SpinEditIncrement>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditIncrementImageHover_Aqua"
                                PressedCssClass="dxEditors_edtSpinEditIncrementImagePressed_Aqua" />
                        </SpinEditIncrement>
                        <SpinEditDecrement>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditDecrementImageHover_Aqua"
                                PressedCssClass="dxEditors_edtSpinEditDecrementImagePressed_Aqua" />
                        </SpinEditDecrement>
                        <SpinEditLargeIncrement>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeIncImageHover_Aqua"
                                PressedCssClass="dxEditors_edtSpinEditLargeIncImagePressed_Aqua" />
                        </SpinEditLargeIncrement>
                        <SpinEditLargeDecrement>
                            <SpriteProperties HottrackedCssClass="dxEditors_edtSpinEditLargeDecImageHover_Aqua"
                                PressedCssClass="dxEditors_edtSpinEditLargeDecImagePressed_Aqua" />
                        </SpinEditLargeDecrement>
                    </ImagesEditors>                    
                </dx:ASPxGridView>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
    </td>
        </tr>
</table>
--%>
