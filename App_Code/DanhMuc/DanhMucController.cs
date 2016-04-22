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
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Xml;
using System.Web;
using DotNetNuke;
using DotNetNuke.Common;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Services.Search;

namespace VNPT.Modules.DanhMuc
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the BloodGroup
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class DanhMucController 
    {

        #region Constructors

        public DanhMucController()
        {
        }

        #endregion

        //nhom chuc danh
        public void ThemNhomChucDanh(NhomChucDanhInfo obj)
        {
            DataProvider.Instance().ThemNhomChucDanh(obj);
        }

        public void XoaNhomChucDanh(NhomChucDanhInfo obj)
        {
            DataProvider.Instance().XoaNhomChucDanh(obj);
        }

        public NhomChucDanhInfo GetNhomChucDanh(int itemId)
        {
            return CBO.FillObject<NhomChucDanhInfo>(DataProvider.Instance().GetNhomChucDanh(itemId));
        }

        public List<NhomChucDanhInfo> GetNhomChucDanhs()
        {
            return CBO.FillCollection<NhomChucDanhInfo>(DataProvider.Instance().GetNhomChucDanhs());
        }

        public void CapNhatNhomChucDanh(NhomChucDanhInfo obj)
        {
            DataProvider.Instance().CapNhatNhomChucDanh(obj);
        }
        //nhom chuc danh B
        public void ThemNhomChucDanhB(NhomChucDanhBInfo obj)
        {
            DataProvider.Instance().ThemNhomChucDanhB(obj);
        }

        public void XoaNhomChucDanhB(NhomChucDanhBInfo obj)
        {
            DataProvider.Instance().XoaNhomChucDanhB(obj);
        }

        public NhomChucDanhBInfo GetNhomChucDanhB(int itemId)
        {
            return CBO.FillObject<NhomChucDanhBInfo>(DataProvider.Instance().GetNhomChucDanhB(itemId));
        }

        public List<NhomChucDanhBInfo> GetNhomChucDanhBs()
        {
            return CBO.FillCollection<NhomChucDanhBInfo>(DataProvider.Instance().GetNhomChucDanhBs());
        }

        public void CapNhatNhomChucDanhB(NhomChucDanhBInfo obj)
        {
            DataProvider.Instance().CapNhatNhomChucDanhB(obj);
        }
        //kha nang cong viec
        public void ThemKhaNang(KhaNangCongViecInfo obj)
        {
            DataProvider.Instance().ThemKhaNang(obj);
        }

        public void XoaKhaNang(KhaNangCongViecInfo obj)
        {
            DataProvider.Instance().XoaKhaNang(obj);
        }

        public KhaNangCongViecInfo GetKhaNang(int itemId)
        {
            return CBO.FillObject<KhaNangCongViecInfo>(DataProvider.Instance().GetKhaNang(itemId));
        }

        public List<KhaNangCongViecInfo> GetKhaNangs()
        {
            return CBO.FillCollection<KhaNangCongViecInfo>(DataProvider.Instance().GetKhaNangs());
        }

        public void CapNhatKhaNang(KhaNangCongViecInfo obj)
        {
            DataProvider.Instance().CapNhatKhaNang(obj);
        }
        //nhom chuyen nganh
        public void ThemNhomChuyenNganh(NhomChuyenNganhInfo obj)
        {
            DataProvider.Instance().ThemNhomChuyenNganh(obj);
        }

        public void XoaNhomChuyenNganh(NhomChuyenNganhInfo obj)
        {
            DataProvider.Instance().XoaNhomChuyenNganh(obj);
        }

        public NhomChuyenNganhInfo GetNhomChuyenNganh(int itemId)
        {
            return CBO.FillObject<NhomChuyenNganhInfo>(DataProvider.Instance().GetNhomChuyenNganh(itemId));
        }

        public List<NhomChuyenNganhInfo> GetNhomChuyenNganhs()
        {
            return CBO.FillCollection<NhomChuyenNganhInfo>(DataProvider.Instance().GetNhomChuyenNganhs());
        }

        public void CapNhatNhomChuyenNganh(NhomChuyenNganhInfo obj)
        {
            DataProvider.Instance().CapNhatNhomChuyenNganh(obj);
        }
        //khoa dao tao 
        public void ThemKhoaDaoTao(KhoaDaoTaoInfo obj)
        {
            DataProvider.Instance().ThemKhoaDaoTao(obj);
        }

        public void XoaKhoaDaoTao(KhoaDaoTaoInfo obj)
        {
            DataProvider.Instance().XoaKhoaDaoTao(obj);
        }

        public KhoaDaoTaoInfo GetKhoaDaoTao(int itemId)
        {
            return CBO.FillObject<KhoaDaoTaoInfo>(DataProvider.Instance().GetKhoaDaoTao(itemId));
        }

        public List<KhoaDaoTaoInfo> GetKhoaDaoTaos()
        {
            return CBO.FillCollection<KhoaDaoTaoInfo>(DataProvider.Instance().GetKhoaDaoTaos());
        }

        public void CapNhatKhoaDaoTao(KhoaDaoTaoInfo obj)
        {
            DataProvider.Instance().CapNhatKhoaDaoTao(obj);
        }

    }
}

