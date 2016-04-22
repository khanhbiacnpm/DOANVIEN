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

namespace VNPT.Modules.Training
{   
    public class TrainingController 
    {

        #region Constructors

        public TrainingController()
        {
        }

        #endregion

        public void AddTraining(TrainingInfo objTraining)
        {
            DataProvider.Instance().AddTraining(objTraining);
        }

        public void DeleteTraining(TrainingInfo objTraining)
        {
            DataProvider.Instance().DeleteTraining(objTraining);
        }

        public TrainingInfo GetTraining(int itemId)
        {
            return  CBO.FillObject<TrainingInfo>(DataProvider.Instance().GetTraining(itemId));           
        }
        
        public List<TrainingInfo> GetTrainings()
        {
            return CBO.FillCollection<TrainingInfo>(DataProvider.Instance().GetTrainings());
        }
        public List<TrainingInfo> GetTrainingByEmployee(int employeeId)
        {
            return CBO.FillCollection<TrainingInfo>(DataProvider.Instance().GetTrainingByEmployee(employeeId));
        }
        public List<TrainingInfo> GetTrainingByDecision(string decision)
        {
            return CBO.FillCollection<TrainingInfo>(DataProvider.Instance().GetTrainingByDecision(decision));
        }
        
        public void UpdateTraining(TrainingInfo objTraining)
        {
            DataProvider.Instance().UpdateTraining(objTraining);
        }

    }
}

