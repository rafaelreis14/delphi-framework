using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.Data.Common;
using System.Runtime.InteropServices;

namespace DBConnect.Class
{
    public interface IDBConnection
    {
        DbConnection ActiveConnection1 { get; }
        DbConnection ActiveConnection2 { get; }
        DbConnection ActiveConnection3 { get; }
    }
}

