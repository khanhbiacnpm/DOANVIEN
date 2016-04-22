
using System;
using DotNetNuke;
using System.Data;

using DotNetNuke.Framework;

namespace VNPT.Modules.Religion
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.Religion", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddReligions(ReligionInfo objReligions);
        public abstract IDataReader GetReligion(int itemId);
        public abstract IDataReader GetReligions();
        public abstract void UpdateReligions(ReligionInfo objReligions);
        public abstract void DeleteReligions(ReligionInfo objReligions);

    }

}
