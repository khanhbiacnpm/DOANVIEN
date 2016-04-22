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

namespace Philip.Modules.Office
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the Office
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class OfficeController
    {

        public void AddOffice(OfficeInfo objOffice)
        {
            DataProvider.Instance().AddOffice(objOffice);
        }

        public void DeleteOffice(OfficeInfo objOffice)
        {
            DataProvider.Instance().DeleteOffice(objOffice);
        }
        public OfficeInfo GetOffice(int itemId)
        {
            return CBO.FillObject<OfficeInfo>(DataProvider.Instance().GetOffice(itemId));

        }
        public OfficeInfo GetOfficeByCode(string itemId)
        {
            return CBO.FillObject<OfficeInfo>(DataProvider.Instance().GetOfficeByCode(itemId));
        }
        
        public List<OfficeInfo> GetOffices(int type)
        {
            return CBO.FillCollection<OfficeInfo>(DataProvider.Instance().GetOffices(type));
        }
        public List<OfficeInfo> GetOfficeMaxId()
        {
            return CBO.FillCollection<OfficeInfo>(DataProvider.Instance().GetOfficeMaxId());
        }
        public void UpdateOffice(OfficeInfo objOffice)
        {
            DataProvider.Instance().UpdateOffice(objOffice);
        }


    }
}

