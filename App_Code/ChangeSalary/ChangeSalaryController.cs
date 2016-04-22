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

namespace VNPT.Modules.ChangeSalary
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the ChangeSalary
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class ChangeSalaryController
    {

        #region Constructors

        public ChangeSalaryController()
        {
        }

        #endregion

        public void AddChangeSalary(ChangeSalaryInfo objChangeSalary)
        {
            DataProvider.Instance().AddChangeSalary(objChangeSalary);
        }
        public void DeleteChangeSalary(ChangeSalaryInfo objChangeSalary)
        {
            DataProvider.Instance().DeleteChangeSalary(objChangeSalary);
        }
        public void DeleteChangeSalarys(int id, int type)
        {
            DataProvider.Instance().DeleteChangeSalarys(id, type);
        }
        public ChangeSalaryInfo GetChangeSalary(int itemId)
        {
            return CBO.FillObject<ChangeSalaryInfo>(DataProvider.Instance().GetChangeSalary(itemId));       
        }
        public ChangeSalaryInfo GetNgachBac(int classId, DateTime changedate)
        {
            return CBO.FillObject<ChangeSalaryInfo>(DataProvider.Instance().GetNgachBac(classId,changedate));
        }
        public List<ChangeSalaryInfo> GetNangBacLuong_QTCongTacByThoiGian(int empid, DateTime tuNgay, DateTime denNgay)
        {
            return CBO.FillCollection<ChangeSalaryInfo>(DataProvider.Instance().GetNangBacLuong_QTCongTacByThoiGian(empid, tuNgay, denNgay));
        }
        public List<ChangeSalaryInfo> GetChangeSalarys()
        {
            return CBO.FillCollection<ChangeSalaryInfo>(DataProvider.Instance().GetChangeSalarys());
        }

        public List<ChangeSalaryInfo> GetChangeSalaryB()
        {
            return CBO.FillCollection<ChangeSalaryInfo>(DataProvider.Instance().GetChangeSalaryB());
        }
        public List<ChangeSalaryInfo> GetChangeSalaryByEmployee(int employeeId)
        {
            return CBO.FillCollection<ChangeSalaryInfo>(DataProvider.Instance().GetChangeSalaryByEmployee(employeeId));
        }
        public List<ChangeSalaryInfo> GetChangeSalaryBByEmployee(int employeeId)
        {
            return CBO.FillCollection<ChangeSalaryInfo>(DataProvider.Instance().GetChangeSalaryBByEmployee(employeeId));
        }
        public void UpdateChangeSalary(ChangeSalaryInfo objChangeSalary)
        {
            DataProvider.Instance().UpdateChangeSalary(objChangeSalary);
        }

        public ChangeSalaryInfo GetSalaryHistory(int empid, DateTime tuNgay, DateTime denNgay)
        {
            return CBO.FillObject<ChangeSalaryInfo>(DataProvider.Instance().GetSalaryHistory(empid, tuNgay, denNgay));
        }
    }
}

