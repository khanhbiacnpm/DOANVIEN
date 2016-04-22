

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

namespace VNPT.Modules.Province
{
    public class ProvinceController : ISearchable
    {

        #region Constructors

        public ProvinceController()
        {

        }

        #endregion

        #region Public Methods

       
        public void AddProvince(ProvinceInfo objProvince)
        {
            if (objProvince.Name.Trim() != "")
            {
                DataProvider.Instance().AddProvince(0, objProvince.Name, objProvince.AddedDay, objProvince.CreatedByUser, objProvince.Ip);
            }
        }

       
        public void DeleteProvince(int ItemId, int UserID, string Ip)
        {
            DataProvider.Instance().DeleteProvince(ItemId, UserID, Ip);
        }

        public ProvinceInfo GetProvince(int ItemId)
        {
            return CBO.FillObject<ProvinceInfo>(DataProvider.Instance().GetProvince(ItemId));
        }

       
        public List<ProvinceInfo> GetProvinces()
        {
            return CBO.FillCollection<ProvinceInfo>(DataProvider.Instance().GetProvinces());
        }

        public void UpdateProvince(ProvinceInfo objProvince)
        {
            if (objProvince.Name.Trim() != "")
            {
                DataProvider.Instance().UpdateProvince(objProvince.Id, objProvince.Name, objProvince.AddedDay, objProvince.CreatedByUser, objProvince.Ip);
            }
        }

        #endregion

        #region Optional Interfaces

        public SearchItemInfoCollection GetSearchItems(ModuleInfo ModInfo)
        {
            SearchItemInfoCollection SearchItemCollection = new SearchItemInfoCollection();
            List<ProvinceInfo> colProvinces = GetProvinces();

            foreach (ProvinceInfo objProvince in colProvinces)
            {
                if (objProvince != null)
                {
                    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objProvince.Name, objProvince.CreatedByUser, objProvince.CreatedDate, ModInfo.ModuleID, objProvince.Id.ToString(), objProvince.Name, "ItemId=" + objProvince.Id.ToString());
                    SearchItemCollection.Add(SearchItem);
                }
            }

            return SearchItemCollection;
        }



        #endregion

    }
}

