using Dapper;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using static Dapper.SqlMapper;

namespace AccountERPApi.DBManager
{
    public class Dapperr : IDapper
    {
        private string Connectionstring = "DefaultConnection";
        //private readonly IConfiguration _configuration;

        public Dapperr(IConfiguration configuration)
        {
            try
            {
                Connectionstring = configuration.GetConnectionString("dbconnection");//  ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                using (var cn = new SqlConnection(Connectionstring))
                {
                    SqlConnection.ClearAllPools();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public DbConnection GetDbconnection()
        {
            return new SqlConnection(Connectionstring);
        }

        public void Dispose()
        {

        }

        public int Execute(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure)
        {
            throw new NotImplementedException();
        }

        public T Get<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.Text)
        {
            try
            {
                IDbConnection db = new SqlConnection(Connectionstring);
                var res = db.Query<T>(sp, parms, commandType: commandType).FirstOrDefault();
                db.Close();
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public List<T> GetAll<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure)
        {
            try
            {
                IDbConnection db = new SqlConnection(Connectionstring);
                var res = db.Query<T>(sp, parms, commandType: commandType).ToList();
                db.Close();
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public GridReader GetMultiple(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure)
        {
            try
            {
                IDbConnection db = new SqlConnection(Connectionstring);
                var res = db.QueryMultiple(sp, parms, commandType: commandType);

                db.Close();
                return res;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        public T Insert<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure)
        {
            T result;
            IDbConnection db = new SqlConnection(Connectionstring);
            try
            {
                if (db.State == ConnectionState.Closed)
                    db.Open();

                var tran = db.BeginTransaction();
                try
                {
                    result = db.Query<T>(sp, parms, commandType: commandType, transaction: tran).FirstOrDefault();
                    tran.Commit();
                }
                catch (DbException ex)
                {
                    tran.Rollback();
                    throw ex;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (db.State == ConnectionState.Open)
                    db.Close();
            }

            return result;
        }

        public T Update<T>(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure)
        {
            T result;
            IDbConnection db = new SqlConnection(Connectionstring);
            try
            {
                if (db.State == ConnectionState.Closed)
                    db.Open();

                var tran = db.BeginTransaction();
                try
                {
                    result = db.Query<T>(sp, parms, commandType: commandType, transaction: tran).FirstOrDefault();
                    tran.Commit();
                }
                catch (Exception ex)
                {
                    tran.Rollback();
                    throw ex;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (db.State == ConnectionState.Open)
                    db.Close();
            }

            return result;
        }

        public Tuple<IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>, IEnumerable<T5>, IEnumerable<T6>> GetMultipleObjects<T1, T2, T3, T4, T5, T6>(string sql, object parameters,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T1>> func1,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T2>> func2,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T3>> func3,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T4>> func4,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T5>> func5,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T6>> func6)
        {
            try
            {
                var objs = GetMultiple(sql, parameters, func1, func2, func3, func4, func5, func6);
                return Tuple.Create(objs[0] as IEnumerable<T1>, objs[1] as IEnumerable<T2>, objs[2] as IEnumerable<T3>, objs[3] as IEnumerable<T4>, objs[4] as IEnumerable<T5>, objs[5] as IEnumerable<T6>);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Tuple<IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>, IEnumerable<T5>> GetMultipleObjects<T1, T2, T3, T4, T5>(string sql, object parameters,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T1>> func1,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T2>> func2,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T3>> func3,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T4>> func4,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T5>> func5)
        {
            try
            {
                var objs = GetMultiple(sql, parameters, func1, func2, func3, func4, func5);
                return Tuple.Create(objs[0] as IEnumerable<T1>, objs[1] as IEnumerable<T2>, objs[2] as IEnumerable<T3>, objs[3] as IEnumerable<T4>, objs[4] as IEnumerable<T5>);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private List<object> GetMultiple(string sql, object parameters, params Func<Dapper.SqlMapper.GridReader, object>[] readerFuncs)
        {
            try
            {
                var returnResults = new List<object>();
                using (IDbConnection db = new SqlConnection(Connectionstring))
                {
                    var gridReader = db.QueryMultiple(sql, parameters, null, null, CommandType.StoredProcedure);

                    foreach (var readerFunc in readerFuncs)
                    {
                        var obj = readerFunc(gridReader);
                        returnResults.Add(obj);
                    }
                }

                return returnResults;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Tuple<IEnumerable<T1>, IEnumerable<T2>> GetMultipleObjects<T1, T2>(string sql, object parameters,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T1>> func1,
                                        Func<Dapper.SqlMapper.GridReader, IEnumerable<T2>> func2
                                       )
        {
            try
            {
                var objs = GetMultiple(sql, parameters, func1, func2);
                return Tuple.Create(objs[0] as IEnumerable<T1>, objs[1] as IEnumerable<T2>);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Tuple<IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>> GetMultipleObjects<T1, T2, T3>(string sql, object parameters, Func<SqlMapper.GridReader, IEnumerable<T1>> func1, Func<SqlMapper.GridReader, IEnumerable<T2>> func2, Func<SqlMapper.GridReader, IEnumerable<T3>> func3)
        {
            try
            {
                var objs = GetMultiple(sql, parameters, func1, func2, func3);
                return Tuple.Create(objs[0] as IEnumerable<T1>, objs[1] as IEnumerable<T2>, objs[2] as IEnumerable<T3>);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Tuple<IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>> GetMultipleObjects<T1, T2, T3, T4>(string sql, object parameters, Func<SqlMapper.GridReader, IEnumerable<T1>> func1, Func<SqlMapper.GridReader, IEnumerable<T2>> func2, Func<SqlMapper.GridReader, IEnumerable<T3>> func3, Func<SqlMapper.GridReader, IEnumerable<T4>> func4)
        {
            try
            {
                var objs = GetMultiple(sql, parameters, func1, func2, func3, func4);
                return Tuple.Create(objs[0] as IEnumerable<T1>, objs[1] as IEnumerable<T2>, objs[2] as IEnumerable<T3>, objs[3] as IEnumerable<T4>);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Tuple<IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>, IEnumerable<T5>, IEnumerable<T6>, IEnumerable<T7>> GetMultipleObjects<T1, T2, T3, T4, T5, T6, T7>(string sql, object parameters, Func<SqlMapper.GridReader, IEnumerable<T1>> func1, Func<SqlMapper.GridReader, IEnumerable<T2>> func2, Func<SqlMapper.GridReader, IEnumerable<T3>> func3, Func<SqlMapper.GridReader, IEnumerable<T4>> func4, Func<SqlMapper.GridReader, IEnumerable<T5>> func5, Func<SqlMapper.GridReader, IEnumerable<T6>> func6, Func<SqlMapper.GridReader, IEnumerable<T7>> func7)
        {
            try
            {
                var objs = GetMultiple(sql, parameters, func1, func2, func3, func4, func5, func6, func7);
                return Tuple.Create(objs[0] as IEnumerable<T1>, objs[1] as IEnumerable<T2>, objs[2] as IEnumerable<T3>, objs[3] as IEnumerable<T4>, objs[4] as IEnumerable<T5>, objs[5] as IEnumerable<T6>, objs[6] as IEnumerable<T7>);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Insert(string sp, DynamicParameters parms, CommandType commandType = CommandType.StoredProcedure)
        {
            //var result;
            IDbConnection db = new SqlConnection(Connectionstring);
            try
            {
                if (db.State == ConnectionState.Closed)
                    db.Open();

                var tran = db.BeginTransaction();
                try
                {
                    db.Query(sp, parms, commandType: commandType, transaction: tran).FirstOrDefault();
                    tran.Commit();
                }
                catch (DbException ex)
                {
                    tran.Rollback();
                    throw ex;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                if (db.State == ConnectionState.Open)
                    db.Close();
            }
        }

        public Tuple<IEnumerable<T1>, IEnumerable<T2>, IEnumerable<T3>, IEnumerable<T4>, IEnumerable<T5>, IEnumerable<T6>, Tuple<IEnumerable<T7>, IEnumerable<T8>, IEnumerable<T9>>> GetMultipleObjects<T1, T2, T3, T4, T5, T6, T7, T8, T9>(string sql, object parameters, Func<GridReader, IEnumerable<T1>> func1, Func<GridReader, IEnumerable<T2>> func2, Func<GridReader, IEnumerable<T3>> func3, Func<GridReader, IEnumerable<T4>> func4, Func<GridReader, IEnumerable<T5>> func5, Func<GridReader, IEnumerable<T6>> func6, Func<GridReader, IEnumerable<T7>> func7, Func<GridReader, IEnumerable<T8>> func8, Func<GridReader, IEnumerable<T9>> func9)
        {
            try
            {
                var objs = GetMultiple(sql, parameters, func1, func2, func3, func4, func5, func6, func7, func8, func9);

                return Tuple.Create(objs[0] as IEnumerable<T1>, objs[1] as IEnumerable<T2>, objs[2] as IEnumerable<T3>, objs[3] as IEnumerable<T4>, objs[4] as IEnumerable<T5>, objs[5] as IEnumerable<T6>, Tuple.Create(objs[6] as IEnumerable<T7>, objs[7] as IEnumerable<T8>, objs[8] as IEnumerable<T9>));
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
