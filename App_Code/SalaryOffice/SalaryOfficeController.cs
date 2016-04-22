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

namespace Philip.Modules.SalaryOffice
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the SalaryOffice
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class SalaryOfficeController 
    {

        public void AddSalaryOffice(SalaryOfficeInfo objSalaryOffice)
        {
            DataProvider.Instance().AddSalaryOffice(objSalaryOffice);
        }

        public void DeleteSalaryOffice(SalaryOfficeInfo objSalaryOffice)
        {
            DataProvider.Instance().DeleteSalaryOffice(objSalaryOffice);
        }
        public void UpdateSalaryOffice(SalaryOfficeInfo objSalaryOffice)
        {
            DataProvider.Instance().UpdateSalaryOffice(objSalaryOffice);
        }
        public List<SalaryOfficeInfo> GetSalaryOfficeByOffice(int IdchucDanh, int IdQLNNuoc, int option)
        {
            return CBO.FillCollection<SalaryOfficeInfo>(DataProvider.Instance().GetSalaryOfficeByOffice(IdchucDanh, IdQLNNuoc, option));
        }
        public SalaryOfficeInfo GetSalaryOfficeByOfficeCheckQLNN_NL(int IdchucDanh, int IdQLNNuoc, int IdNhomLuong)
        {
            return CBO.FillObject<SalaryOfficeInfo>(DataProvider.Instance().GetSalaryOfficeByOfficeCheckQLNN_NL(IdchucDanh, IdQLNNuoc, IdNhomLuong));
        }
        public List<SalaryOfficeInfo> GetSalaryOffices()
        {
            return CBO.FillCollection<SalaryOfficeInfo>(DataProvider.Instance().GetSalaryOffices());
        }
        public SalaryOfficeInfo GetSalaryOffice(int Id)
        {
            return CBO.FillObject<SalaryOfficeInfo>(DataProvider.Instance().GetSalaryOffice(Id));

        }
        public List<SalaryOfficeInfo> GetSalaryOfficeByChucDanh(int Id)
        {
            return CBO.FillCollection<SalaryOfficeInfo>(DataProvider.Instance().GetSalaryOfficeByChucDanh(Id));

        }
        public List<ChucDanhInfo> GetSalaryOfficeByCD_NhomLuong(int IdChucDanh)
        {
            return CBO.FillCollection<ChucDanhInfo>(DataProvider.Instance().GetSalaryOfficeByCD_NhomLuong(IdChucDanh));

        }
    }
}

