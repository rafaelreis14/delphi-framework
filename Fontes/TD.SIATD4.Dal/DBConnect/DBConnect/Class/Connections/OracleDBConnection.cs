using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OracleClient;
using System.Runtime.InteropServices;

namespace DBConnect.Class
{
    class OracleDBConnection:IDBConnection
    {

        public System.Data.Common.DbConnection ActiveConnection1
        {
            get
            {
                throw new NotImplementedException();
            }
         
        }

        public System.Data.Common.DbConnection ActiveConnection2
        {
            get
            {
                throw new NotImplementedException();
            }

        }

        public System.Data.Common.DbConnection ActiveConnection3
        {
            get
            {
                throw new NotImplementedException();
            }

        }
    }
}
