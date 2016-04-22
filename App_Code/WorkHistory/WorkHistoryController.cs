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

namespace VNPT.Modules.WorkHistory
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the WorkHistory
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class WorkHistoryController 
    {

        #region Constructors

        public WorkHistoryController()
        {
        }

        #endregion

        public void AddWorkHistory(WorkHistoryInfo objWorkHistory)
        {
            DataProvider.Instance().AddWorkHistory(objWorkHistory);
        }

        public void DeleteWorkHistory(WorkHistoryInfo objWorkHistory)
        {
            DataProvider.Instance().DeleteWorkHistory(objWorkHistory);
        }
        public void DeleteWorkHistorys(int id)
        {
            DataProvider.Instance().DeleteWorkHistorys(id);
        }

        public WorkHistoryInfo GetWorkHistory(int itemid)
        {
            return CBO.FillObject<WorkHistoryInfo>(DataProvider.Instance().GetWorkHistory(itemid));
        }
        public List<WorkHistoryInfo> GetWorkHistorys()
        {
            return CBO.FillCollection<WorkHistoryInfo>(DataProvider.Instance().GetWorkHistorys());
        }
        public List<WorkHistoryInfo> GetWorkHistoryByEmployee(int employeeId)
        {
            return CBO.FillCollection<WorkHistoryInfo>(DataProvider.Instance().GetWorkHistoryByEmployee(employeeId));
        }       
        public void UpdateWorkHistory(WorkHistoryInfo objWorkHistory)
        {
            DataProvider.Instance().UpdateWorkHistory(objWorkHistory);
        }
        public List<WorkHistoryInfo> GetQTCongTacTuNgayDenNgay(int empid, DateTime tuNgay, DateTime denNgay)
        {
            return CBO.FillCollection<WorkHistoryInfo>(DataProvider.Instance().GetQTCongTacTuNgayDenNgay(empid, tuNgay, denNgay));
        }

        public WorkHistoryInfo GetWorkHistory(int empid, DateTime tuNgay, DateTime denNgay)
        {
            return CBO.FillObject<WorkHistoryInfo>(DataProvider.Instance().GetWorkHistory(empid, tuNgay, denNgay));
        }
    }
}

