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

namespace VNPT.Modules.RewardDiscipline
{
   
    public class RewardDisciplineController 
    {
        
        #region Constructors

        public RewardDisciplineController()
        {
        }

        #endregion


        public void AddRewardDiscipline(RewardDisciplineInfo objRewardDiscipline)
        {
            DataProvider.Instance().AddRewardDiscipline(objRewardDiscipline);
        }

        public void DeleteRewardDiscipline(RewardDisciplineInfo objRewardDiscipline)
        {
            DataProvider.Instance().DeleteRewardDiscipline(objRewardDiscipline);
        }
        public void DeleteRewardDisciplines(int id, int loai)
        {
            DataProvider.Instance().DeleteRewardDisciplines(id,loai);
        }

        public RewardDisciplineInfo GetRewardDiscipline(int itemId)
        {
            return CBO.FillObject<RewardDisciplineInfo>(DataProvider.Instance().GetRewardDiscipline(itemId));        
        }

        public RewardDisciplineInfo GetLatestDiscipline(int idnhanvien)
        {
            return CBO.FillObject<RewardDisciplineInfo>(DataProvider.Instance().GetLatestDiscipline(idnhanvien));
        }

        public List<RewardDisciplineInfo> GetRewardDisciplines()
        {
            return CBO.FillCollection<RewardDisciplineInfo>(DataProvider.Instance().GetRewardDisciplines());
        }
        public List<RewardDisciplineInfo> GetRewardDisciplinesByObject(int objectId, int objectType, int type)
        {
            return CBO.FillCollection<RewardDisciplineInfo>(DataProvider.Instance().GetRewardDisciplinesByObject(objectId,objectType, type));
        }
        public List<RewardDisciplineInfo> GetRewardDisciplineByEmp(int objectId, int objectType)
        {
            return CBO.FillCollection<RewardDisciplineInfo>(DataProvider.Instance().GetRewardDisciplineByEmp(objectId, objectType));
        }
        public RewardDisciplineInfo GetRewardDisciplineByLevel(int EmpId)
        {
            return CBO.FillObject<RewardDisciplineInfo>(DataProvider.Instance().GetRewardDisciplineByLevel(EmpId));
        }
        public void UpdateRewardDiscipline(RewardDisciplineInfo objRewardDiscipline)
        {
            DataProvider.Instance().UpdateRewardDiscipline(objRewardDiscipline);
        }


    

    }
}

