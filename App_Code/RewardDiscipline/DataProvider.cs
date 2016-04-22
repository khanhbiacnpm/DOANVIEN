using System;
using DotNetNuke;
using System.Data;
using DotNetNuke.Framework;

namespace VNPT.Modules.RewardDiscipline
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
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.RewardDiscipline", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
            
           
        }
        
        public abstract void AddRewardDiscipline(RewardDisciplineInfo objRewardDiscipline);
        public abstract IDataReader GetRewardDiscipline(int itemId);
        public abstract IDataReader GetLatestDiscipline(int idnhanvien);
        public abstract IDataReader GetRewardDisciplines();
        
        public abstract IDataReader GetRewardDisciplinesByObject(int objectId,int objectType,int type);
        public abstract IDataReader GetRewardDisciplineByEmp(int objectId, int objectType);
        public abstract IDataReader GetRewardDisciplineByLevel(int EmpId);
        public abstract void UpdateRewardDiscipline(RewardDisciplineInfo objRewardDiscipline);
        public abstract void DeleteRewardDiscipline(RewardDisciplineInfo objRewardDiscipline);
        public abstract void DeleteRewardDisciplines(int id,int loai);

    }
}