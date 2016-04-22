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

namespace Philip.Modules.Salary_Group
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the Salary_Group
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class Salary_GroupController 
    {

        public void AddSalary_Group(Salary_GroupInfo objSalary_Group)
        {
            DataProvider.Instance().AddSalary_Group(objSalary_Group);
        }

        public void DeleteSalary_Group(Salary_GroupInfo objSalary_Group)
        {
            DataProvider.Instance().DeleteSalary_Group(objSalary_Group);
        }

        public Salary_GroupInfo GetSalary_Group(int itemId)
        {
            return CBO.FillObject<Salary_GroupInfo>(DataProvider.Instance().GetSalary_Group(itemId));
        }
        public List<Salary_GroupInfo> GetSalaryGroupByParent(int itemId)
        {
            return CBO.FillCollection<Salary_GroupInfo>(DataProvider.Instance().GetSalaryGroupByParent(itemId));
        }
        public List<Salary_GroupInfo> GetSalaryGroupByType(int itemId)
        {
            return CBO.FillCollection<Salary_GroupInfo>(DataProvider.Instance().GetSalaryGroupByType(itemId));
        }
        public List<Salary_GroupInfo> GetSalaryGroupBByType()
        {
            return CBO.FillCollection<Salary_GroupInfo>(DataProvider.Instance().GetSalaryGroupBByType());
        }
        public List<Salary_GroupInfo> GetSalaryTypeRoot()
        {
            return CBO.FillCollection<Salary_GroupInfo>(DataProvider.Instance().GetSalaryTypeRoot());
        }

        public List<Salary_GroupInfo> GetParentSalaryGroup(int type)
        {
            return CBO.FillCollection<Salary_GroupInfo>(DataProvider.Instance().GetParentSalaryGroup(type));
        }
        
        public List<Salary_GroupInfo> GetSalary_Groups()
        {
            return CBO.FillCollection<Salary_GroupInfo>(DataProvider.Instance().GetSalary_Groups());
        }

        public void UpdateSalary_Group(Salary_GroupInfo objSalary_Group)
        {
            DataProvider.Instance().UpdateSalary_Group(objSalary_Group);
        }
    }
}

