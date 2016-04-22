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

namespace VNPT.Modules.PoliticalConsciousness
{
    /// -----------------------------------------------------------------------------
    ///<summary>
    /// The Controller class for the PoliticalConsciousness
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    public class PoliticalConsciousnessController
    {

        #region Constructors

        public PoliticalConsciousnessController()
        {
        }

        #endregion
        public void AddPoliticalConsciousness(PoliticalConsciousnessInfo objPoliticalConsciousness)
        {
            DataProvider.Instance().AddPoliticalConsciousness(objPoliticalConsciousness);
        }

        public void DeletePoliticalConsciousness(PoliticalConsciousnessInfo objPoliticalConsciousness)
        {
            DataProvider.Instance().DeletePoliticalConsciousness(objPoliticalConsciousness);
        }

        public PoliticalConsciousnessInfo GetPoliticalConsciousness(int itemId)
        {
            return CBO.FillObject<PoliticalConsciousnessInfo>(DataProvider.Instance().GetPoliticalConsciousness(itemId));
            
        }

        public List<PoliticalConsciousnessInfo> GetListPoliticalConsciousnesss()
        {
            return CBO.FillCollection<PoliticalConsciousnessInfo>(DataProvider.Instance().GetListPoliticalConsciousnesss());
        }

        public void UpdatePoliticalConsciousness(PoliticalConsciousnessInfo objPoliticalConsciousness)
        {
            DataProvider.Instance().UpdatePoliticalConsciousness(objPoliticalConsciousness);
        }


    }
}

