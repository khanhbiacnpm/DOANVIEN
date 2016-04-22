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

namespace VNPT.Modules.Employees
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the Employees
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class EmployeesController 
    {
        
        #region Constructors

        public EmployeesController()
        {
        }

        #endregion

        public void AddEmployees(EmployeesInfo objEmployees)
        {
            DataProvider.Instance().AddEmployees(objEmployees);
        }

        public void DeleteEmployees(EmployeesInfo objEmployees)
        {
            DataProvider.Instance().DeleteEmployees(objEmployees);
        }

        public EmployeesInfo GetEmployees(int itemId)
        {
            return CBO.FillObject<EmployeesInfo>(DataProvider.Instance().GetEmployees(itemId));
        }
       
        public List<EmployeesInfo> GetEmployeess()
        {
            return CBO.FillCollection<EmployeesInfo>(DataProvider.Instance().GetEmployeess());
        }
        public List<EmployeesInfo> GetEmployeesEmpcode(int unitid)
        {
            return CBO.FillCollection<EmployeesInfo>(DataProvider.Instance().GetEmployeesEmpcode(unitid));
        }
        public List<EmployeesInfo> GetEmployeesSearch()
        {
            return CBO.FillCollection<EmployeesInfo>(DataProvider.Instance().GetEmployeesSearch());
        }
        
        public List<EmployeesInfo> GetEmptyEmp()
        {
            return CBO.FillCollection<EmployeesInfo>(DataProvider.Instance().GetEmptyEmp());
        }
        public List<EmployeesInfo> GetColleaguesEmployee(int unitid)
        {
            return CBO.FillCollection<EmployeesInfo>(DataProvider.Instance().GetColleaguesEmployee(unitid));
        }
        public EmployeesInfo GetEmployeeByCode(string code)
        {
            return CBO.FillObject<EmployeesInfo>(DataProvider.Instance().GetEmployeeByCode(code));
        }
        public EmployeesInfo GetEmployeeByCardId(string code)
        {
            return CBO.FillObject<EmployeesInfo>(DataProvider.Instance().GetEmployeeByCardId(code));
        }
        
        public List<EmployeesInfo> GetBirthDay()
        {
            return CBO.FillCollection<EmployeesInfo>(DataProvider.Instance().GetBirthDay());
        }
    
        public List<EmployeesInfo> GetEmployeesByUnit(decimal unitId)
        {
            return CBO.FillCollection<EmployeesInfo>(DataProvider.Instance().GetEmployeesByUnit(unitId));
        }
        public EmployeesInfo GetEmployeesByIdMax()
        {
            return CBO.FillObject<EmployeesInfo>(DataProvider.Instance().GetEmployeesByIdMax());
        }
        public void UpdateEmployees(EmployeesInfo objEmployees)
        {
            DataProvider.Instance().UpdateEmployees(objEmployees);
        }
        public EmployeesInfo Get_GiamDocTT(int unitId)
        {
            return CBO.FillObject<EmployeesInfo>(DataProvider.Instance().Get_GiamDocTT(unitId));
        }
    }
}

