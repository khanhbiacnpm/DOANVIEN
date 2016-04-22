/*
' DotNetNuke� - http://www.dotnetnuke.com
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

namespace VNPT.Modules.PartyMember
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the PartyMember
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class PartyMemberController 
    {

        #region Constructors

        public PartyMemberController()
        {
        }

        #endregion

        public void AddPartyMember(PartyMemberInfo objPartyMember)
        {
            DataProvider.Instance().AddPartyMember(objPartyMember);
        }

        public void DeletePartyMember(PartyMemberInfo objPartyMember)
        {
            DataProvider.Instance().DeletePartyMember(objPartyMember);
        }

        public PartyMemberInfo GetPartyMember(int itemId)
        {
            return CBO.FillObject<PartyMemberInfo>(DataProvider.Instance().GetPartyMember(itemId));
          
        }

        public List<PartyMemberInfo> GetPartyMembers()
        {
            return CBO.FillCollection<PartyMemberInfo>(DataProvider.Instance().GetPartyMembers());
        }
        public List<PartyMemberInfo> GetPartyMemberByEmployee(int employeeId)
        {
            return CBO.FillCollection<PartyMemberInfo>(DataProvider.Instance().GetPartyMemberByEmployee(employeeId));
        }

        public void UpdatePartyMember(PartyMemberInfo objPartyMember)
        {
            DataProvider.Instance().UpdatePartyMember(objPartyMember);
        }
        public List<PartyMemberInfo> GetPartyMemberByEmployee_ChucVuDang(int employeeId)
        {
            return CBO.FillCollection<PartyMemberInfo>(DataProvider.Instance().GetPartyMemberByEmployee_ChucVuDang(employeeId));
        }
    }
}

