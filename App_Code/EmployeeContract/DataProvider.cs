using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.EmployeeContract
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.EmployeeContract", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddEmployeeContract(EmployeeContractInfo objEmployeeContract);
        public abstract IDataReader GetEmployeeContract(int itemId);
        public abstract IDataReader GetEmployeeContracts();
        public abstract IDataReader GetContractExpried();
        public abstract IDataReader GetContractsByEmployess(int employeeId);
        public abstract IDataReader GetEmployeeContractType(int employeeId, int idLoaiHopDong);
        public abstract IDataReader GetContractsByEmployess_khanh(int employeeId);
        public abstract void UpdateEmployeeContract(EmployeeContractInfo objEmployeeContract);
        public abstract void DeleteEmployeeContract(EmployeeContractInfo objEmployeeContract);
        public abstract void DeleteEmployeeContracts(int id);

    }
}