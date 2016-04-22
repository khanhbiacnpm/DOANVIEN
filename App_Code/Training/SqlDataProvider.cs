using System;
using System.Data;
using System.Data.SqlClient;

using Microsoft.ApplicationBlocks.Data;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;

namespace VNPT.Modules.Training
{
    public class SqlDataProvider : DataProvider
    {

        private const string ProviderType = "data";
        private ProviderConfiguration _providerConfiguration = ProviderConfiguration.GetProviderConfiguration(ProviderType);
        private string _connectionString;
        private string _databaseOwner;

        public SqlDataProvider()
        {
            Provider objProvider = (Provider)_providerConfiguration.Providers[_providerConfiguration.DefaultProvider];
            _connectionString = Config.GetConnectionString();

            if (_connectionString.Length == 0)
            {
                _connectionString = objProvider.Attributes["connectionString"];
            }

            _databaseOwner = objProvider.Attributes["databaseOwner"];
            if ((_databaseOwner != "") && (_databaseOwner.EndsWith(".") == false))
            {
                _databaseOwner += ".";
            }
        }

        public string ConnectionString
        {
            get { return _connectionString; }
        }

        public string DatabaseOwner
        {
            get { return _databaseOwner; }
        }

        private string GetFullyQualifiedName(string name)
        {
            return DatabaseOwner + name;
        }

        private Object GetNull(Object Field)
        {
            return Null.GetNull(Field, DBNull.Value);
        }

        public override void AddTraining(TrainingInfo objTraining)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Training"), objTraining.id, objTraining.schoolname, objTraining.skill, objTraining.fromdate, objTraining.todate, objTraining.trainingformid, objTraining.qualificationid, objTraining.decision, objTraining.employeeid, objTraining.fee, objTraining.editor, objTraining.modifieddate, objTraining.ip, objTraining.diadiemtochucId, objTraining.donvitochucId,objTraining.result, objTraining.fileKem, objTraining.camket, 0);
        }
        public override void DeleteTraining(TrainingInfo objTraining)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Training"), objTraining.id, objTraining.schoolname, objTraining.skill, objTraining.fromdate, objTraining.todate, objTraining.trainingformid, objTraining.qualificationid, objTraining.decision, objTraining.employeeid, objTraining.fee, objTraining.editor, objTraining.modifieddate, objTraining.ip, objTraining.diadiemtochucId, objTraining.donvitochucId, objTraining.result, objTraining.fileKem, objTraining.camket, 2);
        }
        public override IDataReader GetTraining(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetTraining"), itemId);
        }
        public override IDataReader GetTrainings()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetTraining"), 0);
        }
        public override IDataReader GetTrainingByEmployee(int employeeId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetTrainingByEmployee"), employeeId);
        }
        public override IDataReader GetTrainingByDecision(string decision)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetTrainingByDecision"), decision);
        }        
        public override void UpdateTraining(TrainingInfo objTraining)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Training"), objTraining.id, objTraining.schoolname, objTraining.skill, objTraining.fromdate, objTraining.todate, objTraining.trainingformid, objTraining.qualificationid, objTraining.decision, objTraining.employeeid, objTraining.fee, objTraining.editor, objTraining.modifieddate, objTraining.ip, objTraining.diadiemtochucId, objTraining.donvitochucId, objTraining.result, objTraining.fileKem, objTraining.camket, 1);
        }

    }

}
