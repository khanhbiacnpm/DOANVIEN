using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.Leave
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.Leave", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddLeave(LeaveInfo objLeave);
        public abstract IDataReader GetLeave(int itemId);
        public abstract IDataReader GetLeaves();
        public abstract IDataReader GetLeaveByEmp(int empId);
        public abstract IDataReader GetLeaveByTime(int month,int year);
        public abstract void UpdateLeave(LeaveInfo objLeave);
        public abstract void DeleteLeave(LeaveInfo objLeave);

    }
}