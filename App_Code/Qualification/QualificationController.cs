

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

namespace VNPT.Modules.Qualification
{

    public class QualificationController 
    {

        #region Constructors

        public QualificationController()
        {
        }

        #endregion

        public void AddQualifications(QualificationsInfo objQualifications)
        {
            DataProvider.Instance().AddQualifications(objQualifications);
        }

        public void DeleteQualifications(QualificationsInfo objQualifications)
        {
            DataProvider.Instance().DeleteQualifications(objQualifications);
        }

        public QualificationsInfo GetQualification(int itemId)
        {
            return CBO.FillObject<QualificationsInfo>(DataProvider.Instance().GetQualification(itemId));
          
        }
        public List<QualificationsInfo> GetQualifications()
        {
            return CBO.FillCollection<QualificationsInfo>(DataProvider.Instance().GetQualifications());
        }

        public void UpdateQualifications(QualificationsInfo objQualifications)
        {
            DataProvider.Instance().UpdateQualifications(objQualifications);
        }
        public QualificationsInfo GetQualificationByCode(string itemId)
        {
            return CBO.FillObject<QualificationsInfo>(DataProvider.Instance().GetQualificationByCode(itemId));
        }
    }
}

