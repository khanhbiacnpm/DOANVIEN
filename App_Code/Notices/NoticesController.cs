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

namespace VNPT.Modules.Notices
{
    public class NoticesController : ISearchable
    {
        public NoticesController()
        {

        }
        public void AddNotices(NoticesInfo objNotices)
        {
            if (objNotices.title.Trim() != "")
            {
                DataProvider.Instance().AddNotices(objNotices);
            }
        }


        public void DeleteNotices(NoticesInfo objNotices)
        {
            DataProvider.Instance().DeleteNotices(objNotices);
        }

        public NoticesInfo GetNotices(int itemId)
        {
            return CBO.FillObject<NoticesInfo>(DataProvider.Instance().GetNotices(itemId));
        }
        public List<NoticesInfo> GetDisplayedNotices(int itemId)
        {
            return CBO.FillCollection<NoticesInfo>(DataProvider.Instance().GetDisplayedNotices(itemId));
        }


        public List<NoticesInfo> GetNoticess()
        {
            return CBO.FillCollection<NoticesInfo>(DataProvider.Instance().GetNoticess());
        }
        public List<NoticesInfo> GetTopNotices()
        {
            return CBO.FillCollection<NoticesInfo>(DataProvider.Instance().GetTopNotices());
        }

        public void UpdateNotices(NoticesInfo objNotices)
        {
            if (objNotices.title.Trim() != "")
            {
                DataProvider.Instance().UpdateNotices(objNotices);
            }
        }
        public SearchItemInfoCollection GetSearchItems(ModuleInfo ModInfo)
        {
            SearchItemInfoCollection SearchItemCollection = new SearchItemInfoCollection();
            List<NoticesInfo> colNotices = GetNoticess();

            foreach (NoticesInfo objNotices in colNotices)
            {
                if (objNotices != null)
                {
                    SearchItemInfo SearchItem = new SearchItemInfo(ModInfo.ModuleTitle, objNotices.title, objNotices.editor, objNotices.notedate, ModInfo.ModuleID, objNotices.id.ToString(), objNotices.title, "ItemId=" + objNotices.id.ToString());
                    SearchItemCollection.Add(SearchItem);
                }
            }

            return SearchItemCollection;
        }
    }
}
