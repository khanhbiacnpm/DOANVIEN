using System;
using System.Data;
using System.Data.SqlClient;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke.Common.Utilities;
using DotNetNuke.Framework.Providers;


namespace VNPT.Modules.Position
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

        public override void AddPosition(PositionInfo objPosition)
        {            
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Position"), objPosition.id, objPosition.name, objPosition.isactive, objPosition.type, objPosition.coefficient, objPosition.ecoefficient, objPosition.rcoefficient, 0);
        }
        public override void UpdatePosition(PositionInfo objPosition)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Position"), objPosition.id, objPosition.name, objPosition.isactive, objPosition.type, objPosition.coefficient, objPosition.ecoefficient, objPosition.rcoefficient, 1);
        }
        public override void DeletePosition(PositionInfo objPosition)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_Position"), objPosition.id, objPosition.name, objPosition.isactive, objPosition.type, objPosition.coefficient, objPosition.ecoefficient, objPosition.rcoefficient, 2);
        }
        public override IDataReader GetPosition(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetPositon"), itemId);
        }
        public override IDataReader GetPositionByType(int itemId)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetPositonByType"), itemId);
        }
        public override IDataReader GetPositions()
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetPositon"), 0);
        } 
        // hs chuc vu
        public override void themHSChucVu(hschucvuInfo objPosition)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_HSCHUCVU"), objPosition.id, objPosition.positionid,objPosition.hschucvu,objPosition.hstrachnhiem,objPosition.hsdochai,objPosition.thoidiem, 0);
        }
        public override void suaHSChucVu(hschucvuInfo objPosition)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_HSCHUCVU"), objPosition.id, objPosition.positionid, objPosition.hschucvu, objPosition.hstrachnhiem, objPosition.hsdochai, objPosition.thoidiem, 1);
        }
        public override void xoaHSChucVu(hschucvuInfo objPosition)
        {
            SqlHelper.ExecuteNonQuery(ConnectionString, GetFullyQualifiedName("HRM_HSCHUCVU"), objPosition.id, objPosition.positionid, objPosition.hschucvu, objPosition.hstrachnhiem, objPosition.hsdochai, objPosition.thoidiem, 2);
        }
        public override IDataReader GetPositionByChucVu(int chucvu)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetHS_CHUCVU_ChucVu"), chucvu);
        }
        public override IDataReader GetPositionByThoiDiem(int chucvu)
        {
            return (IDataReader)SqlHelper.ExecuteReader(ConnectionString, GetFullyQualifiedName("HRM_GetHS_CHUCVU_ThoiDiem"), chucvu);
        }         
    }
}
