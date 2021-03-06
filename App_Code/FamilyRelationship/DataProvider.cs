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

namespace VNPT.Modules.FamilyRelationship
{
    public abstract class DataProvider
    {

        static DataProvider objProvider = null;

        static DataProvider()
        {
            CreateProvider();
        }

        private static void CreateProvider()
        {
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.FamilyRelationship", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddFamilyRelationship(FamilyRelationshipInfo objFamilyRelationship);
        public abstract IDataReader GetFamilyRelationship(int itemId);
        public abstract IDataReader GetFamilyRelationships();
        public abstract IDataReader GetFamilyByEmployess(int employeeId,int option);
        public abstract IDataReader GetFamilyByEmployess(int employeeId);
        public abstract void UpdateFamilyRelationship(FamilyRelationshipInfo objFamilyRelationship);
        public abstract void DeleteFamilyRelationship(FamilyRelationshipInfo objFamilyRelationship);

    }

}
