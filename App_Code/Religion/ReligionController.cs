

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

namespace VNPT.Modules.Religion
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the Religion
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class ReligionController
    {

        #region Constructors

        public ReligionController()
        {
        }

        #endregion

        public void AddReligions(ReligionInfo objReligions)
        {
            DataProvider.Instance().AddReligions(objReligions);
        }

        public void DeleteReligions(ReligionInfo objReligions)
        {
            DataProvider.Instance().DeleteReligions(objReligions);
        }

        public ReligionInfo GetReligion(int itemId)
        {
            return CBO.FillObject<ReligionInfo>(DataProvider.Instance().GetReligion(itemId));
        }

        public List<ReligionInfo> GetReligions()
        {
            return CBO.FillCollection<ReligionInfo>(DataProvider.Instance().GetReligions());
        }

        public void UpdateReligions(ReligionInfo objReligions)
        {
            DataProvider.Instance().UpdateReligions(objReligions);
        }


    }
}

