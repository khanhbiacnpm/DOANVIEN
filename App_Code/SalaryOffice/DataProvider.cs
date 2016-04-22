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
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace Philip.Modules.SalaryOffice
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// An abstract class that provides the DAL contract
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public abstract class DataProvider
    {
        #region Shared/Static Methods

        // singleton reference to the instantiated object 
        static DataProvider objProvider = null;

        // constructor
        static DataProvider()
        {
            CreateProvider();
        }

        // dynamically create provider
        private static void CreateProvider()
        {
            objProvider = (DataProvider)Reflection.CreateObject("data", "Philip.Modules.SalaryOffice", "");
        }

        // return the provider
        public static DataProvider Instance()
        {
            return objProvider;
        }

        #endregion
        public abstract void AddSalaryOffice(SalaryOfficeInfo objSalaryOffice);
        public abstract IDataReader GetSalaryOffice(int Id);
        public abstract IDataReader GetSalaryOfficeByChucDanh(int Id);
        public abstract IDataReader GetSalaryOfficeByCD_NhomLuong(int IdChucDanh);
        public abstract IDataReader GetSalaryOfficeByOffice(int IdchucDanh, int IdQLNNuoc, int option);
        public abstract IDataReader GetSalaryOfficeByOfficeCheckQLNN_NL(int IdchucDanh, int IdQLNNuoc, int IdNhomLuong);
        public abstract IDataReader GetSalaryOffices();
        public abstract void UpdateSalaryOffice(SalaryOfficeInfo objSalaryOffice);
        public abstract void DeleteSalaryOffice(SalaryOfficeInfo objSalaryOffice);
    }
}
