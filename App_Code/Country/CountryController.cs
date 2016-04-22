/*
' DotNetNukeŽ - http://www.dotnetnuke.com
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

namespace Philip.Modules.Country
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the Country
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class CountryController 
    {

        public void AddCountry(CountryInfo objCountry)
        {
            DataProvider.Instance().AddCountry(objCountry);
        }

        public void DeleteCountry(CountryInfo objCountry)
        {
            DataProvider.Instance().DeleteCountry(objCountry);
        }
        public CountryInfo GetCountry(int itemId)
        {
            return CBO.FillObject<CountryInfo>(DataProvider.Instance().GetCountry(itemId));
        }
        public List<CountryInfo> GetCountrys()
        {
            return CBO.FillCollection<CountryInfo>(DataProvider.Instance().GetCountrys());
        }

        public void UpdateCountry(CountryInfo objCountry)
        {
            DataProvider.Instance().UpdateCountry(objCountry);
        }

    }
}

