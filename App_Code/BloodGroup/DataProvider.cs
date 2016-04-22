using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.BloodGroup
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.BloodGroup", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddBloodGroup(BloodGroupInfo objBloodGroup);
        public abstract IDataReader GetBloodGroup(int itemId);
        public abstract IDataReader GetBloodGroups();
        public abstract void UpdateBloodGroup(BloodGroupInfo objBloodGroup);
        public abstract void DeleteBloodGroup(BloodGroupInfo objBloodGroup);

    }
}