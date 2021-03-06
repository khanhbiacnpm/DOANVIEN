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

namespace VNPT.Modules.SalaryType
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the SalaryType
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class SalaryTypeController 
    {

        #region Constructors

        public SalaryTypeController()
        {
        }

        #endregion
        public void AddSalaryType(SalaryTypeInfo objACoefficient)
        {
            DataProvider.Instance().AddSalaryType(objACoefficient);
        }
        public void DeleteSalaryType(SalaryTypeInfo objACoefficient)
        {
            DataProvider.Instance().DeleteSalaryType(objACoefficient);
        }
        public SalaryTypeInfo GetSalaryType(int itemId)
        {
            return CBO.FillObject<SalaryTypeInfo>(DataProvider.Instance().GetSalaryType(itemId));      
        }
        public List<SalaryTypeInfo> GetACoefficientByGroup(int itemId)
        {
            return CBO.FillCollection<SalaryTypeInfo>(DataProvider.Instance().GetACoefficientByGroup(itemId));      
        }
        public List<SalaryTypeInfo> GetACoefficientByParentId(int itemIdParentid, DateTime dateeffectted, int option)
        {
            return CBO.FillCollection<SalaryTypeInfo>(DataProvider.Instance().GetACoefficientByParentId(itemIdParentid, dateeffectted, option));
        }
        public List<SalaryTypeInfo> GetSalaryTypes()
        {
            return CBO.FillCollection<SalaryTypeInfo>(DataProvider.Instance().GetSalaryTypes());
        }
        public void UpdateSalaryType(SalaryTypeInfo objACoefficient)
        {
            DataProvider.Instance().UpdateSalaryType(objACoefficient);
        }
        public SalaryTypeInfo GetSalaryGroupIdMax(bool type)
        {
            return CBO.FillObject<SalaryTypeInfo>(DataProvider.Instance().GetSalaryGroupIdMax(type));
        }
        // phần bac luong cao nhat thuoc nhom luong
        public void AddBacLuongCaoNhat(BacLuongTheoNhomInfo objbacluong)
        {
            DataProvider.Instance().AddBacLuongCaoNhat(objbacluong);
        }
        public void UpdateBacLuongCaoNhat(BacLuongTheoNhomInfo objbacluong)
        {
            DataProvider.Instance().UpdateBacLuongCaoNhat(objbacluong);
        }
        public void DeleteBacLuongCaoNhat(BacLuongTheoNhomInfo objbacluong)
        {
            DataProvider.Instance().DeleteBacLuongCaoNhat(objbacluong);
        }
        public BacLuongTheoNhomInfo GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(int idNhomLuong, bool kieuLuong, DateTime thoiDiem)
        {
            return CBO.FillObject<BacLuongTheoNhomInfo>(DataProvider.Instance().GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(idNhomLuong, kieuLuong, thoiDiem));
        }
        public BacLuongTheoNhomInfo GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(int idItem)
        {
            return CBO.FillObject<BacLuongTheoNhomInfo>(DataProvider.Instance().GetBacLuongCaoNhat_ThuocNhomTheoThoiDiem(idItem));
        }
        public List<BacLuongTheoNhomInfo> GetBacLuongCaoNhat_IdNhomLuong(int idNhomLuong)
        {
            return CBO.FillCollection<BacLuongTheoNhomInfo>(DataProvider.Instance().GetBacLuongCaoNhat_IdNhomLuong(idNhomLuong));
        }
    }
}