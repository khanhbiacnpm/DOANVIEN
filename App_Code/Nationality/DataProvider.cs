

using System;
using DotNetNuke;
using System.Data;

using DotNetNuke.Framework;

namespace VNPT.Modules.Nationality
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.Nationality", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddNationality(NationalityInfo objNationality);
        public abstract IDataReader GetNationality(int itemId);
        public abstract IDataReader GetNationalities();
        public abstract void UpdateNationality(NationalityInfo objNationality);
        public abstract void DeleteNationality(NationalityInfo objNationality);

    }

}
