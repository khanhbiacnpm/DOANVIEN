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

namespace VNPT.Modules.HealthCare
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the HealthCare
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class HealthCareController 
    {

        #region Constructors

        public HealthCareController()
        {
        }

        #endregion
        public void AddHealthCare(HealthCareInfo objHealthCare)
        {
            DataProvider.Instance().AddHealthCare(objHealthCare);
        }

        public void DeleteHealthCare(HealthCareInfo objHealthCare)
        {
            DataProvider.Instance().DeleteHealthCare(objHealthCare);
        }
        public void DeleteHealthCares(int id)
        {
            DataProvider.Instance().DeleteHealthCares(id);
        }

        public HealthCareInfo GetHealthCare(int itemId)
        {
            return CBO.FillObject<HealthCareInfo>(DataProvider.Instance().GetHealthCare(itemId));
        }

        public List<HealthCareInfo> GetHealthCares()
        {
            return CBO.FillCollection<HealthCareInfo>(DataProvider.Instance().GetHealthCares());
        }
        public List<HealthCareInfo> GetHealthCareByEmployee(int employeeId)
        {
            return CBO.FillCollection<HealthCareInfo>(DataProvider.Instance().GetHealthCareByEmployee(employeeId));
        }

        public void UpdateHealthCare(HealthCareInfo objHealthCare)
        {
            DataProvider.Instance().UpdateHealthCare(objHealthCare);
        }

    }
}

