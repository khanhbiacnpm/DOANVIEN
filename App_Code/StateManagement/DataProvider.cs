using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.StateManagement
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.StateManagement", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddStateManagement(StateManagementInfo objStateManagement);
        public abstract IDataReader GetStateManagement(int itemId);
        public abstract IDataReader GetStateManagements();
        public abstract void UpdateStateManagement(StateManagementInfo objStateManagement);
        public abstract void DeleteStateManagement(StateManagementInfo objStateManagement);

    }
}