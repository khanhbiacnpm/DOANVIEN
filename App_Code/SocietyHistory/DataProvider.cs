using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.SocietyHistory
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.SocietyHistory", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddSocietyHistory(SocietyHistoryInfo objSocietyHistory);
        public abstract IDataReader GetSocietyHistory(int itemId);
        public abstract IDataReader GetSocietyHistorys();
        public abstract IDataReader GetSocietyHistoryByEmployess(int employeeId);
        public abstract void UpdateSocietyHistory(SocietyHistoryInfo objSocietyHistory);
        public abstract void DeleteSocietyHistory(SocietyHistoryInfo objSocietyHistory);
        // danh gia doan vien 

        public abstract void AddSort(SortSociety objSocietyHistory);
        public abstract IDataReader GetSortSociety(int itemId);
        public abstract IDataReader GetSortSocieties();
        public abstract IDataReader GetSortSocietyByEmployess(int employeeId);
        public abstract void UpdateSort(SortSociety objSocietyHistory);
        public abstract void DeleteSort(SortSociety objSocietyHistory);
    }
}