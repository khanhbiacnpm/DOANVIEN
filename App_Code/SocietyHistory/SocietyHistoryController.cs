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

namespace VNPT.Modules.SocietyHistory
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the SocietyHistory
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class SocietyHistoryController 
    {

        #region Constructors

        public SocietyHistoryController()
        {
        }

        #endregion

        public void AddSocietyHistory(SocietyHistoryInfo objSocietyHistory)
        {
            DataProvider.Instance().AddSocietyHistory(objSocietyHistory);
        }

        public void DeleteSocietyHistory(SocietyHistoryInfo objSocietyHistory)
        {
            DataProvider.Instance().DeleteSocietyHistory(objSocietyHistory);
        }

        public SocietyHistoryInfo GetSocietyHistory(int itemId)
        {
            return CBO.FillObject<SocietyHistoryInfo>(DataProvider.Instance().GetSocietyHistory(itemId));
        }

        public List<SocietyHistoryInfo> GetSocietyHistorys()
        {
            return CBO.FillCollection<SocietyHistoryInfo>(DataProvider.Instance().GetSocietyHistorys());
        }

        public void UpdateSocietyHistory(SocietyHistoryInfo objSocietyHistory)
        {
            DataProvider.Instance().UpdateSocietyHistory(objSocietyHistory);
        }
        public List<SocietyHistoryInfo> GetSocietyHistoryByEmployess(int employeeId)
        {
            return CBO.FillCollection<SocietyHistoryInfo>(DataProvider.Instance().GetSocietyHistoryByEmployess(employeeId));
        }
        //danh gia doan vien 
        public void AddSort(SortSociety objSocietyHistory)
        {
            DataProvider.Instance().AddSort(objSocietyHistory);
        }

        public void DeleteSort(SortSociety objSocietyHistory)
        {
            DataProvider.Instance().DeleteSort(objSocietyHistory);
        }

        public SortSociety GetSortSociety(int itemId)
        {
            return CBO.FillObject<SortSociety>(DataProvider.Instance().GetSortSociety(itemId));
        }

        public List<SortSociety> GetSortSocieties()
        {
            return CBO.FillCollection<SortSociety>(DataProvider.Instance().GetSortSocieties());
        }

        public void UpdateSort(SortSociety objSocietyHistory)
        {
            DataProvider.Instance().UpdateSort(objSocietyHistory);
        }
        public List<SortSociety> GetSortSocietyByEmployess(int employeeId)
        {
            return CBO.FillCollection<SortSociety>(DataProvider.Instance().GetSortSocietyByEmployess(employeeId));
        }

    }
}

