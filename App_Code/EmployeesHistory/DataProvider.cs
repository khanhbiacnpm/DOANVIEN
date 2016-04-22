using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.EmployeesHistory
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.EmployeesHistory", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddEmployeesHistory(EmployeesHistoryInfo objEmployeesHistory);
        public abstract IDataReader GetEmployeesHistory(int itemId);
        public abstract IDataReader GetEmployeesHistorys();
        public abstract IDataReader GetEmployeeHistoryByEmployess(int employeeId);
        public abstract void UpdateEmployeesHistory(EmployeesHistoryInfo objEmployeesHistory);
        public abstract void DeleteEmployeesHistory(EmployeesHistoryInfo objEmployeesHistory);

    }
}