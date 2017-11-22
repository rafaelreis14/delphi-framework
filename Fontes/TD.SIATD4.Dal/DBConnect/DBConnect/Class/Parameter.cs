using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;


namespace DBConnect.Class
{

    [ComVisible(true)]
    [Guid("AA2C1BA3-FB06-44C2-84F6-8DB2889617AB")]
    public interface IParameter
    {
        bool Add(string key, string value, string process, string line = "");
    }

    [ComVisible(true)]
    [Guid("E43E448D-5FD1-408D-8644-F773B271E2E8")]
    public class Parameters : IParameter
    {
        public List<ParameterItems> Items { get; set; }
        //
        public Parameters()
        {
            this.Items = new List<ParameterItems>();
        }

         public bool Add(string key, string value, string process, string line = "")
        {
            Items.Add(new ParameterItems { Key = key, Value = value, Process = process, Line = line });
            return true;
        }
    }

    [ComVisible(true)]
    [Guid("477182FB-72EA-4A97-B23C-965F832E980E")]
    public interface IParameterItems
    {
        string Key { get; set; }
        string Value { get; set; }
        string Process { get; set; }
        string Line { get; set; }
        string PriorValue { get; set; }
    }


    [ComVisible(true)]
    [Guid("B0160A8F-BE46-44FB-8729-B5DA6A212147")]
    public class ParameterItems : IParameterItems
    {
        public string Key { get; set; }
        public string Value { get; set; }
        public string Process { get; set; }
        public string Line { get; set; }
        public string PriorValue { get; set; }

        public ParameterItems(string key, string value)
        {
            this.Key = key;
            this.Value = value;
        }

        public ParameterItems()
        {
            
        }
    }

}
