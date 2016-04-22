<%@ Control Language="C#" Inherits="VNPT.Modules.CapUser.ViewNhanVien" CodeFile="ViewNhanVien.ascx.cs"
    AutoEventWireup="true" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxTreeList.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTreeList" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxHiddenField" TagPrefix="dx" %>
<script type="text/javascript">
    $(function () {      
        SetGridHeight();        
    });

    function SetGridHeight() {
        var marker = $("#pos_marker").offset().top;
        var wHeight = $(window).height();
        gridThanhVien.SetHeight(wHeight - marker - 20);
    }
    function focus_treelist(s, e) {
        var key = treelist_donvi.GetFocusedNodeKey();
        gridThanhVien.PerformCallback(key);
    }
    function taikhoan_nhanvien(trang_thai, username) {
        if (trang_thai == 0) {
            gridThanhVien.PerformCallback('cap;' + username);
        }
        else if (trang_thai == 1) {
            var kqx = confirm('Bạn có muốn xóa tài khoản này không?');
            if (kqx)
                gridThanhVien.PerformCallback('xoa;' + username);
        }
        else if (trang_thai == 2) {
            var kq = confirm('Bạn có muốn phục hồi lại mật khẩu không?');
            if (kq)
                gridThanhVien.PerformCallback('phuchoi;' + username);
        } else if (trang_thai == 3) {
            var kq = confirm('Bạn có muốn xóa thành viên này không?');
            if (kq)
                gridThanhVien.PerformCallback('thanhvien;' + username);
        }
    }
    function endcallback_thanhvien() {
        if (gridThanhVien.cpXoa == 1) {
            var key = treelist_donvi.GetFocusedNodeKey();
            delete gridThanhVien.cpXoa;
            gridThanhVien.PerformCallback(key);
        }
    }
    function endcallback_quyen(s, e) {
        if (s.cpOp == 0) {
            var ls_role = s.cpDataRole;
            listbox_quyen.SelectValues(ls_role);
            delete s.cpOp;
            delete s.cpDataRole;
        } else if (s.cpOp == 1) {
            popup_quyen.Hide();
            alert('Cấp quyền thành công.');
            delete s.cpOp;
        }
    }
    function capquyen_taikhoan(username) {       
        var yPos = (($(window).height()) / 2) - 150;
        var xPos = (($(window).width()) / 2) - 190;
        popup_quyen.ShowAtPos(xPos, yPos);
        hdf_data.Set('username', username);
        listbox_quyen.PerformCallback('hienthi;' + username);
    }
    function kiemtra_capquyen(s, e) {
        var count = listbox_quyen.GetItemCount();
        var data = [];
        for (var i = 0; i < count; i++) {
            var item = listbox_quyen.GetItem(i);
            var item_data = {
                id: item.value,
                chon: item.selected
            };
            data.push(item_data);
        }
        hdf_data.Set('data', data);
        if (hdf_data.Contains('username')) {
            var username = hdf_data.Get('username');
            listbox_quyen.PerformCallback('capquyen;' + username);
        }
    }
</script>
<table border="0" width="100%">
    <tr>
        <td valign="top" style="width:350px;">
            <dx:ASPxTreeList ID="treelist_donvi" runat="server" ClientInstanceName="treelist_donvi" Width="350px"
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Font-Names="arial"
                Font-Size="12px" KeyFieldName="MA_DV" OnVirtualModeCreateChildren="treeList_VirtualModeCreateChildren"
                OnVirtualModeNodeCreating="treeList_VirtualModeNodeCreating">
                <SettingsBehavior AllowFocusedNode="true" FocusNodeOnExpandButtonClick="false" FocusNodeOnLoad="false" />
                <Settings ShowTreeLines="true" SuppressOuterGridLines="true" />
                <ClientSideEvents FocusedNodeChanged="focus_treelist" />
                <Columns>
                    <dx:TreeListTextColumn FieldName="TEN" Caption="Tổ chức">
                    </dx:TreeListTextColumn>
                </Columns>
            </dx:ASPxTreeList>
        </td>

        <td valign="top">     
             <dx:ASPxGridView ID="gridThanhVien" runat="server" Width="100%" Font-Size="12px"
                CssPostfix="Aqua" AutoGenerateColumns="False" OnHtmlDataCellPrepared="gridThanhVien_HtmlDataCellPrepared"
                ClientInstanceName="gridThanhVien" OnHtmlRowCreated="gridThanhVien_HtmlRowCreated"
                KeyFieldName="id" OnCustomCallback="gridThanhVien_CustomCallback">                          
                <ClientSideEvents EndCallback="function(s,e){
                    endcallback_thanhvien();
                }" />
                <SettingsLoadingPanel ImagePosition="Top" />
                <SettingsBehavior AllowFocusedRow="true" />
                <Columns>                             
                    <dx:GridViewDataTextColumn FieldName="ma_thanhvien" Caption="Mã nhân viên" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ten_thanhvien" Caption="Họ tên" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="chuc_vu" Caption="Chức vụ" VisibleIndex="3">                       
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Cấp/xóa tài khoản" VisibleIndex="5" FieldName="id">
                        <DataItemTemplate>
                            <asp:LinkButton ID="linkTaiKhoan" runat="server">
                            </asp:LinkButton>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Mật khẩu" VisibleIndex="6">
                        <DataItemTemplate>
                            <asp:LinkButton ID="linkMatkhau" runat="server">Phục hồi
                            </asp:LinkButton>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>  
                    <dx:GridViewDataTextColumn Caption="Cấp quyền" VisibleIndex="6">
                        <DataItemTemplate>
                            <asp:LinkButton ID="linkCapQuyen" runat="server">
                            </asp:LinkButton>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Hủy thành viên" VisibleIndex="6">
                        <DataItemTemplate>
                            <asp:LinkButton ID="linkHuyThanhVien" runat="server">
                            </asp:LinkButton>
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>                   
                </Columns>
                <Settings ShowGroupButtons="false" ShowStatusBar="Visible"
                    VerticalScrollableHeight="400" />              
                <SettingsLoadingPanel ImagePosition="Top" />
                <Images SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="~/App_Themes/Aqua/GridView/gvLoadingOnStatusBar.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="~/App_Themes/Aqua/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
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
                <ImagesFilterControl>
                    <LoadingPanel Url="~/App_Themes/Aqua/Editors/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua">
                    <LoadingPanel ImageSpacing="8px">
                    </LoadingPanel>
                </Styles>
                <StylesEditors>
                    <CalendarHeader Spacing="1px">
                    </CalendarHeader>
                </StylesEditors>
                <SettingsPager>
                    <Summary AllPagesText="{0} - {1} " Visible="False" />
                </SettingsPager>
                <SettingsPager PageSize="50">
                </SettingsPager>             
            </dx:ASPxGridView>                       
        </td>
    </tr>
</table>
<dx:ASPxHiddenField ID="hdf_data" runat="server" ClientInstanceName="hdf_data" />
<dx:ASPxPopupControl ID="popup_quyen" runat="server" ClientInstanceName="popup_quyen" Width="300px" Height="200px"
    ShowCloseButton="true" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" PopupAnimationType="Fade"
    Modal="true" AllowDragging="true" CloseAction="CloseButton"
    HeaderText="Chi tiết quyền xử lý ứng dụng" Font-Names="arial" Font-Size="12px">    
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
            <dx:PanelContent ID="pc_ct">
                <div style="width:300px; height:230px;">
                    <div style="width:300px; height:auto; margin-bottom:5px;">
                        <dx:ASPxListBox ID="listbox_quyen" runat="server" ValueType="System.Int32" 
                            ClientInstanceName="listbox_quyen" SelectionMode="CheckColumn" Width="300px" Height="200px"
                            OnCallback="listbox_quyen_OnCallback">
                            <ClientSideEvents EndCallback="endcallback_quyen" />
                        </dx:ASPxListBox>        
                    </div>
                    <div style="width:300px; height:25px;">
                        <div style="width:102px; height:25px; float:left;">
                            <dx:ASPxButton ID="bt_capnhat_quyen" runat="server" AutoPostBack="false" Font-Names="arial" Font-Size="12px" Text="Cập nhật" Width="100px">
                                <Image Url="../../images/imgadmin/save_16.png" Height="15px"></Image>
                                <ClientSideEvents Click="kiemtra_capquyen" />                                
                            </dx:ASPxButton>    
                        </div>
                        <div style="width:100px; height:25px; float:left;">
                            <dx:ASPxButton ID="bt_dong_quyen" runat="server" AutoPostBack="false" Font-Names="arial" Font-Size="12px" Text="Đóng" Width="100px">
                                <Image Url="../../images/imgadmin/delete_16.png" Height="15px"></Image>
                                <ClientSideEvents Click="
                                    function(s,e){
                                        popup_quyen.Hide();
                                    }
                                " />
                            </dx:ASPxButton>    
                        </div>
                    </div>
                </div>                
            </dx:PanelContent>            
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

